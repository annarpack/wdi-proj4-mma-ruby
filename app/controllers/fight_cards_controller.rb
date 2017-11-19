class FightCardsController < ApplicationController
  before_action :require_user
    
      def initialize
        url = "http://ufc-data-api.ufc.com/api/v1/us/events"
        results = HTTParty.get(url)
        parsed_results = JSON.parse(results.body)
        @results = parsed_results.map do |result|
          @fight = FightCard.create(
          title: result["base_title"],
          tagline: result["title_tag_line"],
          start_time: result["event_date"],
          arena: result["arena"],
          image: result["feature_image"],
          ticket_url: result["ticketurl"])

        end
      end
      def search
        @date = Date.today
        @start_date = params[:start_date]
        @fights = FightCard.all
      end
      def results
        @date = Date.today
        @start_date = params[:start_date]
          @fights = FightCard.all
      end


      def index
        @fights = FightCard.all
      end
      def show
        @fight = FightCard.find(params[:id])

      end
      def destroy
        @fight = Fight.find(params[:id])
        @fight.destroy
        redirect_to fights_path
      end

      private
      def fight_params
        params.require(:fight).permit(:title, :tagline, :start_time, :arena, :image, :ticket_url)
      end
end
