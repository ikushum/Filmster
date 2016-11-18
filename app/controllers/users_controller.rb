class UsersController < ApplicationController
    def show
        @user = User.includes(:reviews).find(params[:id])
    end 
end
