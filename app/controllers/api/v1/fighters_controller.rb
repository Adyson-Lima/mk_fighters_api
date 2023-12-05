class Api::V1::FightersController < ApplicationController

  #before_action :set_fighter, only: %i[] # show update delete

  def index
    @fighters = Fighter.all 
    render json: @fighters
  end

private

def set_fighter
  @fighter = Fighter.find(params[:id])
end

def fighter_params
  params.require(:fighter).permit(:name, :description)
end

end