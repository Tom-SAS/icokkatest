class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to "/maps/#{comment_params[:map_id]}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, map_id: params[:map_id])
  end
end
