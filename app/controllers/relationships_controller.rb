class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def create
    current_user.follow(@user)
  end
  
  def destroy
    current_user.unfollow(@user)
 end
  
  private
  def check_user
    @user = User.find(params[:user_id])
    if current_user == @user 
        flash[:alert] = "Woops! It seems there was an error."
        redirect_to user_path(@user.id)
    end
  end

end


