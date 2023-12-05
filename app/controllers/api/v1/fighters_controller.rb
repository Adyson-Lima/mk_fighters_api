class Api::V1::FightersController < ApplicationController

  before_action :set_fighter, only: %i[show update] # show update delete

  def index
    @fighters = Fighter.all 
    render json: @fighters
  end

  def show
    render json: @fighter
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      render json: @fighter, status: :created, location: api_v1_fighter_url(@fighter)
    else
      render json: @fighter.errors, status: :unprocessable_entity
    end
  end

  def update
    if @fighter.update(fighter_params)
      render json: @fighter
    else
      render json: @fighter.errors, status: :unprocessable_entity
    end
  end

private

def set_fighter
  @fighter = Fighter.find(params[:id])
end

def fighter_params
  params.require(:fighter).permit(:name, :description)
end

end