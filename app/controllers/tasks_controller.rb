class TasksController < ApplicationController
  def index
    @todo = ToDo.where(user_id: session[:user_id], done: false).order(limit_date: "ASC")
    @todo_done = ToDo.where(user_id: session[:user_id], done: true).order(limit_date: "DESC")

    @todo_fight = []
    fight = Fight.where(user_id: session[:user_id]).order(create_at: "DESC")
    fight.length.times do |i|
      @todo_fight[i] = ToDo.find(fight[i].to_do_id)
    end
  end

  def show
    @todo = ToDo.all.order(id: "DESC")
    @todo_fight = ToDo.all.order(fight: "DESC")
  end

  def yourshow
    @todo = ToDo.where(user_id: params[:user_id])
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
    if @todo[:limit_date].nil?
      flash[:attention] = "リミット日時を正しく入力してください"
      render:new, status: :unprocessable_entity
    elsif @todo[:text].blank?
      flash[:attention] = "テキストを正しく入力してください"
      render:new, status: :unprocessable_entity
    elsif @todo.save
      flash[:notice] = "タスクの登録に成功しました"
      redirect_to("/tasks")
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
    
    if @todo[:limit_date].nil?
      flash[:attention] = "リミット日時を正しく入力してください"
      render:edit, status: :unprocessable_entity
    elsif @todo[:text].blank?
      flash[:attention] = "テキストを正しく入力してください"
      render:edit, status: :unprocessable_entity
    elsif @todo.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/tasks")
    else
      flash[:attention] = ["何か問題が発生しています", "確認してください"]
      render:edit, status: :unprocessable_entity
    end
  end

  def delete
    @todo = ToDo.find(params[:id])
    @todo.destroy
    flash[:notice] = "タスクを削除しました"
    redirect_to("/tasks")
  end

  def done
    @todo = ToDo.find(params[:id])
    if @todo.done
      @todo.update(done: false)
      redirect_to tasks_path
    else
      @todo.update(done: true)
      redirect_to tasks_path
    end
  end

  def yourshow
    @user = User.find(params[:id])
    @todos = Todo,where(user_id: params[:id])
  end

end
