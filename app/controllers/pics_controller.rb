class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def new
    @user = User.find(params[:user_id])
    # @pic = Pic.new
    @pic = Pic.create()
  end

  def create
    @user = User.find(params[:user_id])
    @pic = Pic.create(pic_params)
    # @pic = Pic.new(pic_params)
    @pic.user_id = @user.id
    if @pic.save
      redirect_to user_path(@user)
      # redirect_to pics_path
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
    @pic.destroy
    redirect_to root_path
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end

end
