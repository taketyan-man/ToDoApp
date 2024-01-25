module ApplicationHelper
  def notices_create
    @notices = Notice.where(receivor_id: session[:user_id], checked: false)
  end
end
