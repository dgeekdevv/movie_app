class Api::V1::UsersController < ApplicationController
  before_action :set_movie, only: [:add_to_favorite]
  before_action :set_user, only: %i[add_to_favorite show favourite_movies_list]

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users/1/add_to_favorite Add to favorite movie
  def add_to_favorite
    @favorite = @user.likes.new(movie_id: @movie.id, favorite: true)

    if @favorite.save
      render json: @movie, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # GET /users/1/favourite_movies_list list of favourite movies
  def favourite_movies_list
    render json: @user.movies
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def set_user
    @user = User.find_by_id params[:id]
    render json: { message: 'User not found', status: 404 } if @user.blank?
  end

  def set_movie
    @movie = Movie.find_by_id params[:movie_id]
    render json: { message: 'Movie not found', status: 404 } if @movie.blank?
  end
end
