class ProfilesController < ApplicationController
  before_action :set_user,only: %i[edit update]

  def edit
  end

  def update
      if @user.update(user_params)
          flash[:notice] = "ユーザーを更新しました"
          redirect_to  "/user/#{@user.id}/edit"
      else
          flash.[:attention] = "ユーザーを更新できませんでした"
          render :edit
      end
  end

    private
    def set_user
        @user = User.find(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:email,:first_name,:last_name,:avater,:avater_cash)
    end

end
