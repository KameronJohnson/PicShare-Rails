class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to pics_path
      # redirect_to @pic
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to pics_path
      # redirect_to @pic
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def pic_params
    params.require(:pic).permit(:title)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
