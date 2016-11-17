class Movie < ActiveRecord::Base
    validates :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot, :language, :country, :awards, :poster, :metascore, :imdbrating, :imdbvotes, :imdbid, presence: true    
end
