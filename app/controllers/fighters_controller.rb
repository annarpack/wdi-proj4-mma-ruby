class FightersController < ApplicationController
  before_action :require_user

  def create
    @fighter =  Fighter.new(fighter_params)
    if @fighter.save
      redirect_to fighters_path
    else
      redirect_to search_fighters_path
    end
  end
  def index
    @fighters = Fighter.all
  end
  def show
    @fighter = Fighter.find(params[:id])

  end

  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy
    redirect_to fighters_path
  end

  private
  def fighter_params
    params.require(:fighter).permit(:first_name, :last_name, :weight_class, :wins, :losses, :image)
  end
end
