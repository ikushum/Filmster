class ReviewsController < ApplicationController
  before_action :authenticate_user!

    def create
        @movie = Movie.find_or_initialize_by(imdbid: params[:imdbid])
    
        if @movie.new_record?
            # fetch movie data from API using params[:imdbid]
            @fetched_movie = Omdb::Api.find_by(id: params[:imdbid])
        
            # create a new Movie based on the response data
            @movie.title = @fetched_movie.title
            @movie.year = @fetched_movie.year
            @movie.rated = @fetched_movie.rated
            @movie.released = @fetched_movie.released
            @movie.runtime = @fetched_movie.runtime
            @movie.genre = @fetched_movie.genre
            @movie.director = @fetched_movie.director
            @movie.writer = @fetched_movie.writer
            @movie.actors = @fetched_movie.actors
            @movie.plot = @fetched_movie.plot
            @movie.language = @fetched_movie.language
            @movie.country = @fetched_movie.country
            @movie.awards = @fetched_movie.awards
            @movie.poster = @fetched_movie.poster
            @movie.metascore = @fetched_movie.metascore
            @movie.imdbrating = @fetched_movie.imdbrating
            @movie.imdbvotes = @fetched_movie.imdbvotes
            @movie.imdbid = @fetched_movie.imdbid
            @movie.save
         end
         
        # create a new review and connect it to the current_user and the movie
        @review = current_user.reviews.new(review_params.merge(movie: @movie))
        if @review.save
          flash[:success] = "Review saved!"
          redirect_to root_path
        else
          flash[:alert] = "Woops! It seems there was an error."
          redirect_to root_path
        end
    end
  
    private
    def review_params
        params.require(:review).permit(:comment)
    end

end