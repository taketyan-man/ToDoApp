class CommentsController < ApplicationController
  def index
    @todo = Todo.find(params[:todo_id])
    @comments = Comment.where(todo_id: params[:todo_id])
  end

  def new
    @todo = Todo.find(params[:todo_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @todo = Todo.find(params[:todo_id])
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      @todo.comment += 1
      @todo.save
      notice_create_comment(@comment)
      redirect_to todo_comments_path(@todo)
    else  
      redirect_to new_todo_comment_path(@todo)  , flash: { error: @comment.errors.full_messages }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.text = params[:text]
    if @comment[:text].blank?
      flash[:attention] = "テキストを正しく入力してください"
      render:edit, status: :unprocessable_entity
    elsif @comment.save
      flash[:notice] = "コメントの編集が完了しました"
      redirect_to("/todos/#{@comment.todo_id}/comment")
    else
      flash[:attention] = ["何か問題が発生しています", "確認してください"]
      render:edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @todo = Todo.find(params[:todo_id])
    if session[:user_id] == @comment.user_id || session[:user_id] == @todo.user_id
      @comment.delete
      flash[:notice] = "コメントは削除しました。"
      @todo = Todo.find(params[:todo_id])
      @todo.comment -= 1
      @todo.save
      notice_delete_comment(@comment)
      redirect_to("/todos/#{@comment.todo_id}/comment")
    else
      flash[:attention] = "あなたにはその権限がありません。"
      redirect_to("/todos/#{@comment.todo_id}/comment")
    end
  end

  def report
    @comment = Comment.find(params[:id])
    @report = Report.new(
      user_id: session[:user_id],
      todo_id: @comment.todo_id,
      comment_id: @comment.id
    )
    if @report.save!
      flash[:notice] = "そのコメントを報告しました。"
      redirect_to("/todos/#{@comment.todo_id}/comment")
    else
      flash[:attention] = "報告に失敗しました。"
      redirect_to("/todos/#{@comment.todo_id}/comment")
    end
  end

private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :todo_id)
  end

  def notice_create_comment(data)
    @notice = Notice.new(
        receivor_id: Todo.find(data.todo_id).user_id,
        sender_id: data.user_id, 
        todo_id: data.todo_id,
        action: 1, 
        action_id: data.id
      )
      if @notice.receivor_id == @notice.sender_id
        @notice.checked = true
      else
        @notice.checked = false
      end
    @notice.save!
  end

  def notice_delete_comment(data)
    @notice = Notice.new(
      receivor_id: Todo.find(data.todo_id).user_id,
      sender_id: data.user_id,
      todo_id: data.todo_id, 
      action: 2, 
      action_id: data.id 
    )
    notice_comment = Notice.where(action: 1, action_id: data.id).delete_all
    if @notice.receivor_id == @notice.sender_id
      @notice.checked = true
    else
      @notice.checked = false
    end
    @notice.save!
  end


end
