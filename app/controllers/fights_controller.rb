class FightsController < ApplicationController
      before_action :require_user

    def create
      @fight =  Fight.new(fight_params)
      if @fight.save
        redirect_to fights_path
      else
        redirect_to search_fights_path
      end
    end
    def index
      @user = @current_user.id
      @date = Date.today
      @start_date = params[:start_date]
      @fights = Fight.where(user_id: @user)
    end
    def show
      @user = @current_user.id
      @id = params[:id]
      @fight = Fight.where(user_id: @user, id: @id).first

    end
    def destroy
      @fight = Fight.find(params[:id])
      @fight.destroy
      redirect_to fights_path
    end

    private
    def fight_params
      params.require(:fight).permit(:title, :tagline, :start_time, :arena, :image, :ticket_url, :user_id)
    end
  end
