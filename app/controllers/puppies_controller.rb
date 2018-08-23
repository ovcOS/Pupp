class PuppiesController < ApplicationController
  before_action :find_puppy, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:search, :show]

  def search
    if params[:query].present?
      sql_query = " \
        breeds.name @@ :query \
        OR puppies.gender @@ :query \
      "
      @puppies = Puppy.joins(:breed).where(sql_query, query: "%#{params[:query]}%")
    else
      @puppies = Puppy.all
    end
  end

  def show
  end

  def new
    @puppy = Puppy.new
  end

  def create
    @puppy = Puppy.create(puppy_params)
    @user_id = current_user.id
    @puppy.user_id = @user_id

    if @puppy.save
      redirect_to puppy_path(@puppy)
    else
      render :new
    end
    # raise
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
