class VotesController < ApplicationController
    
    def create 
        @review = Review.find(params[:review_id])
        current_user.vote(@review)
    end 
    
end
