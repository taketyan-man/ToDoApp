class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録成功しました"
      redirect_to todos_path
    else
      redirect_to new_user_path, flash: { error: @user.errors.full_messages }
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_path
  end

  def show
    @user = User.find(params[:id])
    @todos = Todo.where(user_id: @user.id) 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_image_params)
    @user.update(user_params)
    if params[:public] == "true"
      @user.public = true
      @todos = Todo.where(user_id: params[:id], public: false)
      @todos.each do |todo|
        todo.public = true
        todo.save
      end
    elsif params[:public] == "false"
      @user.public = false
      @todos = Todo.where(user_id: params[:id], public: true)
      @todos.each do |todo|
        todo.public = false
        todo.save
      end
    end
    if @user.save
      flash[:notice] = "ユーザー情報の編集しました。"
      redirect_to("/todos")
    else
      redirect_to "/users/#{@user.id}/edit", flash: { error: @user.errors.full_messages }
    end 
  end

  def yourdetil
    @user = User.new
  end

  def login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user[:password] == params[:user][:password]
      session[:user_id] = @user.id
      flash[:notice] =  "ログインできました"
      redirect_to todos_path
    elsif @user && @user[:password] != params[:user][:password]
      flash[:notice] = "パスワードが違います"
      params[:user][:name] = params[:user][:name]
      redirect_to login_path
    else
      flash[:notice] = "ユーザー名が見つかりません"
      redirect_to login_path
    end

  end

  private
    def user_image_params
      attrs = [
        :image_x,
        :image_y,
        :image_w,
        :image_h,
        :aspect_numerator,
        :aspect_denominator,
        :user_image
      ]
      params.require(:user).permit(attrs)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :public)
    end
end