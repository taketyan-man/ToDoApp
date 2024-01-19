class ApplicationController < ActionController::Base
  def application
    @notices = Notice.where(receivor_id: session[:user_id], checked: false).includes(:figth, :comment, :user, :to_do, :alert)
    @notice.each do |notice|
      if notice.action == 0
        fight = Fight.find(notice.action_id).includes(:to_do, :user)
        
      elsif notice.action == 1
        comment = Comment.find(notice.action_id).includes(:to_do, :user)
      elsif notice.action == 2
        alert = Report.find(notice.action_id).includes(:to_do, :comment, :user)
      end
    end
  end
end
