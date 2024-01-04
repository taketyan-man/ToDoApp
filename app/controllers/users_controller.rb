class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録成功しました"
      redirect_to tasks_path
    else
      
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_path
  end

  def show
    @user = User.find(params[:id])
    @todos = ToDo.where(user_id: @user.id) 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "編集が完了しました"
      redirect_to("/tasks/list")
    else
      render:edit, status: :unprocessable_entity
    end
  end

  def yourdetil
    @user = User.new
  end

  def login
    @user = User.find_by(name: params[:name])
    if @user && @user[:password] == params[:password]
      session[:user_id] = @user.id
      flash[:notice] =  "ログインできました"
      redirect_to tasks_path
    elsif @user && @user[:password] != params[:password]
      flash[:notice] = "パスワードが違います"
      params[:name] = params[:name]
      redirect_to user_login_path
    else
      flash[:notice] = "ユーザー名が見つかりません"
      redirect_to user_login_path
    end

  end
end