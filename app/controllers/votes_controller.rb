class VotesController < ApplicationController
    
    def create 
        @review = Review.find(params[:review_id])
        current_user.vote(@review)
    end 
    
    def destroy 
        @review = Review.find(params[:review_id])
        current_user.downvote(@review)
    end 
end
