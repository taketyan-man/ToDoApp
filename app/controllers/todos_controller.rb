class TodosController < ApplicationController
  def index
    @todo = ToDo.where(user_id: session[:user_id], done: false).includes(:fights, :comments).order(limit_date: "ASC")
    @todo_done = ToDo.where(user_id: session[:user_id], done: true).includes(:fights, :comments).order(limit_date: "DESC")

    
    @todo_fight = Fight.where(user_id: session[:user_id]).includes(:user, :to_do).order(created_at: "DESC")
    @user = User.find(session[:user_id])
  end

  def show
    @todo = ToDo.where(public: true).includes(:user, :fights).order(id: "DESC")
    @todo_fight = ToDo.where(public: true).includes(:user, :fights).order(fight: "DESC")
  end
  
  def new
    @todo = ToDo.new
  end

  def create
    @todo = ToDo.new(
      text: params[:text],
      user_id: session[:user_id],
      limit_date: params[:date],
      done: false,
      fight: 0,
      comment: 0
    )
    @user = User.find(session[:user_id])
    if @user.public
      @todo.public = true
    else
      @todo.public = false
    end
    if @todo[:limit_date].nil?
      flash[:attention] = "リミット日時を正しく入力してください"
      render:new, status: :unprocessable_entity
    elsif @todo[:text].blank?
      flash[:attention] = "テキストを正しく入力してください"
      render:new, status: :unprocessable_entity
    elsif @todo.save
      flash[:notice] = "タスクの登録に成功しました"
      redirect_to("/todos")
    else
      flash[:attention] = "何か入力ミスをしています
      。確認してください。"
      render:new, status: :unprocessable_entity
    end
  end

  def edit
    @todo = ToDo.find(params[:id])
  end

  def update
    @todo = ToDo.find(params[:id])
    @todo.text = params[:text]
    @todo.limit_date = params[:date]
    if params[:public] == "true"
      @todo.public = true
    elsif params[:public] == "false"
      @todo.public = false
    end
    if @todo[:limit_date].nil?
      flash[:attention] = "リミット日時を正しく入力してください"
      render:edit, status: :unprocessable_entity
    elsif @todo[:text].blank?
      flash[:attention] = "テキストを正しく入力してください"
      render:edit, status: :unprocessable_entity
    elsif @todo.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/todos")
    else
      flash[:attention] = ["何か問題が発生しています", "確認してください"]
      render:edit, status: :unprocessable_entity
    end
  end

  def delete
    @todo = ToDo.find(params[:id])
    @todo.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/todos")
  end

  def done
    @todo = ToDo.find(params[:id])
    if @todo.done
      @todo.update(done: false)
      redirect_to todos_path
    else
      @todo.update(done: true)
      redirect_to todos_path
    end
  end
end
