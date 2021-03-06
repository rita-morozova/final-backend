class LikesController < ApplicationController

  def index
    likes = Like.all
    render json: likes
 end

 
  def create
    # prevent from liking for other users
    params[:like][:user_id] = current_user.id
    like = Like.new(user_id:current_user.id, photo_id: params[:photo_id])
    if like.save
      render json: like
    else
      render json: like.errors
    end
  end

end
