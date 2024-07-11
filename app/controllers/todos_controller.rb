class TodosController < ApplicationController
  def index
    @todo = Todo.where(user_id: session[:user_id], done: false).includes(:fights, :comments).order(limit_date: "ASC")
    @todo_done = Todo.where(user_id: session[:user_id], done: true).includes(:fights, :comments).order(limit_date: "DESC")

    
    @todo_fight = Fight.where(user_id: session[:user_id]).includes(:user, :todo).order(created_at: "DESC")
    @user = User.find(session[:user_id])
  end

  def show
    @todo = Todo.where(public: true).includes(:user, :fights).order(id: "DESC")
    @todo_fight = Todo.where(public: true).includes(:user, :fights).order(fight: "DESC")
  end
  
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @user = User.find(session[:user_id])
    if @user.public
      @todo.public = true
    else
      @todo.public = false
    end
    if @todo.save
      flash[:notice] = "タスクの登録に成功しました"
      redirect_to("/todos")
    else
      render :new, flash: { error: @todo.errors.full_messages }
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
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
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/todos")
  end

  def done
    @todo = Todo.find(params[:id])
    if @todo.done
      @todo.update(done: false)
      redirect_to todos_path
    else
      @todo.update(done: true)
      redirect_to todos_path
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:text, :limit_date, :public, :user_id, :done, :fight, :comment)
    end
end
