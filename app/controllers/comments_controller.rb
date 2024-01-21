class CommentsController < ApplicationController
  def show
    @todo = ToDo.find(params[:to_do_id])
    @comments = Comment.where(to_do_id: params[:to_do_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(
      user_id: session[:user_id],
      to_do_id: params[:to_do_id],
      text: params[:text]
    )
    if @comment.text.blank?
      flash[:attention] = "テキストを正しく入力してください"
      render:new, status: :unprocessable_entity
    elsif @comment.save
      flash[:notice] = "コメントを投稿しました"
      @todo = ToDo.find(params[:to_do_id])
      @todo.comment += 1
      @todo.save
      notice_create_comment(@comment)
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    else
      flash[:attention] = "何か入力ミスをしています
      。確認してください。"
      render:new, status: :unprocessable_entity
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
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    else
      flash[:attention] = ["何か問題が発生しています", "確認してください"]
      render:edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @todo = ToDo.find(params[:to_do_id])
    if session[:user_id] == @comment.user_id || session[:user_id] == @todo.user_id
      @comment.delete
      flash[:notice] = "コメントは削除しました。"
      @todo = ToDo.find(params[:to_do_id])
      @todo.comment -= 1
      @todo.save
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    else
      flash[:attention] = "あなたにはその権限がありません。"
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    end
  end

  def report
    @comment = Comment.find(params[:id])
    @report = Report.new(
      user_id: session[:user_id],
      to_do_id: @comment.to_do_id,
      comment_id: @comment.id
    )
    if @report.save!
      flash[:notice] = "そのコメントを報告しました。"
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    else
      flash[:attention] = "報告に失敗しました。"
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    end
  end

private
  def notice_create_comment(data)
    @notice = Notice.new(
        receivor_id: ToDo.find(data.to_do_id).user_id,
        sendenr_id: data.user_id, 
        action: 1, 
        action_id: data.id, 
        checked: false
      )
      if @notice.save!
        flash[:notice] = "通知機能成功"
      else
        flash[:attention] = "#{@notice}"
      end
  end

  def notice_delete_comment
  end


end
