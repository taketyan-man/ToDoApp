class ApplicationController < ActionController::Base
  def application
    @notices = Notice.where(receivor_id: session[:user_id], checked: false).includes(:figth, :comment, :user, :to_do, :alert)
  end
end
