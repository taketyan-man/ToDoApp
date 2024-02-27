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
    if params[:public] == "true"
      @user.public = true
    elsif params[:public] == "false"
      @user.public = false
    end
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録成功しました"
      redirect_to tasks_path
    else
      redirect_to user_new_path, flash: { error: @user.errors.full_messages }
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
    @user.user_image = params[:user_image]
    if params[:public] == "true"
      @user.public = true
      @todos = ToDo.where(user_id: params[:id], public: false)
      @todos.each do |todo|
        todo.public = true
        todo.save
      end
    elsif params[:public] == "false"
      @user.public = false
      @todos = ToDo.where(user_id: params[:id], public: true)
      @todos.each do |todo|
        todo.public = false
        todo.save
      end
    end
    if @user.save
      redirect_to("/tasks")
    else
      redirect_to "/user/#{@user.id}/edit", flash: { error: @user.errors.full_messages }
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