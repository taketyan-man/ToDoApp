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
  end

  def destroy
    @comment = Comment.find(params[:id])
    @todo = ToDo.find(params[:to_do_id])
    if session[:user_id] == @comment.user_id || session[:user_id] == @todo.user_id
      @comment.delete
      flash[:notice] = "コメントは削除しました。"
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    else
      flash[:attention] = "あなたにはその権限がありません"
      redirect_to("/tasks/#{@comment.to_do_id}/comment")
    end
  end
end
