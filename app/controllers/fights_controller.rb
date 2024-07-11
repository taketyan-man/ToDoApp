class FightsController < ApplicationController
  def create
    @fight = Fight.new(
      user_id: session[:user_id],
      todo_id: params[:todo_id]
    )
    @fight.save
    @todo = Todo.find(params[:todo_id])
    @todo.fight += 1
    @todo.save
    notice_create_fight(@fight)
    redirect_back fallback_location: '/'
  end

  def destroy
    @fight = Fight.find_by(user_id: session[:user_id], todo_id: params[:todo_id])
    @fight.destroy
    @todo = Todo.find(params[:todo_id])
    @todo.fight -= 1
    @todo.save
    redirect_back fallback_location: '/'
  end

  private
  def notice_create_fight(data)
    @notice = Notice.new(
      receivor_id: Todo.find(data.todo_id).user_id,
      sender_id: session[:user_id], 
      todo_id: params[:todo_id],
      action: 0, 
      action_id: data.id
    )
     # 自分投稿にいいねしたときの対処
    if @notice.receivor_id == @notice.sender_id
      @notice.checked = true
    else
      @notice.checked = false
    end
    # 過去にfightしてるかどうかの確認
    notice_serch = Notice.where(receivor_id: @notice.receivor_id, sender_id: @notice.sender_id, action: @notice.action, todo_id: @notice.todo_id)
    if notice_serch.blank?
        @notice.save!
    end
  end

end
