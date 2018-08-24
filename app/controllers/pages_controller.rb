class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @puppies = Puppy.all
    @bulldog = []
    @labrador = []
    @youngestpups = []
    @puppies.each { |puppy| @bulldog << puppy if puppy.breed.name == 'bulldog' && @bulldog.length < 3}
    @puppies.each { |puppy| @labrador << puppy if puppy.breed.name == 'labrador' && @labrador.length < 3}
    @puppies.each { |puppy| @youngestpups << puppy if puppy.age == 1 && @youngestpups.length < 3}
  end

  def profile
    @user = current_user
  end

  def about
    @user = current_user
  end
end
