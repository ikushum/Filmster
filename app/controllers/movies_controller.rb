class MoviesController < ApplicationController
    
    def show 
        @movie = Movie.includes(:reviews, reviews: :user).find(params[:id])
    end 
    
end
