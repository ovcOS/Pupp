class PuppiesController < ApplicationController
  before_action :find_puppy, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :age, :breed_id, :gender, :photo)
  end

  def find_puppy
    @puppy = Puppy.find(params[:id])
  end
end
