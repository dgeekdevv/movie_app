class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  # GET /movies
  # GET /movies.json
  def index
    render json: Movie.all
  end

  # GET /moview/1
  # GET /movies/1.json
  def show
    render json: { movie: @movie, number_of_likes: @movie.likes.count }
  end

  private

  def set_movie
    @movie = Movie.find_by_id params[:id]
    render json: { message: 'Movie not found', status: 404 } if @movie.blank?
  end
end
