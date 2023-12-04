class FightsController < ApplicationController
  def create
    @fight = Fight.new(
      user_id: session[:user_id],
      to_do_id: params[:to_do_id]
    )
    @fight.save 
    redirect_back fallback_location: '/'
  end

  def destroy
    @fight = Fight.find_by(user_id: session[:user_id], to_do_id: params[:to_do_id])
    @fight.destroy
    redirect_back fallback_location: '/'
  end
end
