class CommentsController < ApplicationController
  def create(data, obj)
    if obj == "comment"
      @notice = Notice.new(
        receivor_id: ToDo.find(data.to_do_id).user_id,
        sendenr_id: data.user_id, 
        action: 1, 
        action_id: data.id, 
        checked: false
      ) 
      @notice.save!
    end 
  end
end