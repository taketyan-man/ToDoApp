class FightsController < ApplicationController
  def create
    @fight = Fight.new(
      user_id: session[:user_id],
      to_do_id: params[:to_do_id]
    )
    @fight.save
    @todo = ToDo.find(params[:to_do_id])
    @todo.fight += 1
    @todo.save
    redirect_back fallback_location: '/'
  end

  def destroy
    @fight = Fight.find_by(user_id: session[:user_id], to_do_id: params[:to_do_id])
    @fight.destroy
    @todo = ToDo.find(params[:to_do_id])
    @todo.fight -= 1
    @todo.save
    redirect_back fallback_location: '/'
  end
end
