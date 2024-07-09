class NoticesController < ApplicationController
  def checked
    @notice = Notice.find(params[:id])
    @notice.checked = true
    if @notice.save!
      redirect_to("/todos/#{@notice.to_do_id}/comment")
    else
      flash[:attention] = ["問題が発生しております。", "少々お時間を置いてから確認してください。"]
      redirect_to("/")
    end
  end
end