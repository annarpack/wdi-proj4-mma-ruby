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
    @user = @current_user.id
    @fighters = Fighter.where(user_id: @user)
  end
  def show
    @user = @current_user.id
    @fighter = Fighter.where(user_id: @user, id: params[:id]).first

  end

  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy
    redirect_to fighters_path
  end

  private
  def fighter_params
    params.require(:fighter).permit(:full_name, :first_name, :last_name, :weight_class, :title_holder, :wins, :losses, :draws, :status, :image, :belt_thumbnail, :user_id)
  end
end
