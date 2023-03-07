class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitters.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
  end
end
