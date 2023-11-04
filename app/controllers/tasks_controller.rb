class TasksController < ApplicationController
  def index
    @todo = ToDo.where(user_id: session[:user_id], done: false)
    @todo_done = ToDo.where(user_id: session[:user_id], done: true)
  end

  def show
    @todo = ToDo.all.order(id: "DESC")
  end

  def new
    @todo = ToDo.new
  end

  def create
    @todo = ToDo.new(
      text: params[:text],
      user_id: session[:user_id],
      limit_date: params[:date],
      done: false
    )
    if @todo.save
      flash[:notice] = "タスクの登録に成功しました"
      redirect_to("/tasks")
    else
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
    if @todo.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/tasks/#{@todo.id}")
    else
      render:edit, status: :unprocessable_entity
    end
  end

  def delete
    @todo = ToDo.find(params[:id])
    @todo.delete
    flash[:notice] = "Todoを削除しました"
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
end
