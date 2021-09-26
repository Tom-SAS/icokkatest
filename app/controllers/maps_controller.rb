class MapsController < ApplicationController
  
  def index
    @maps = Map.all
    @map = Map.new
  end

  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
    @comment = Comment.new
    @comments = @map.comments.includes(:user)
  end

  def create
    map = Map.new(map_params)

    if map.save
      redirect_to action: :index
    else
      redirect_to action: :new

    end
  end

  def destroy
    map = Map.find(params[:id])
    map.destroy
    redirect_to action: :index
  end

  private
  def map_params
    params.require(:map).permit(:address, :name, :message, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end
end
