class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :profile]

  def home
    @puppies = Puppy.all
  end

  def profile
    @user = User.find(params[:id])
  end
end
