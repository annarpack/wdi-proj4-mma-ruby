class FighterDatumController < ApplicationController
  before_action :require_user


  def search
    url = "http://ufc-data-api.ufc.com/api/v1/us/fighters"
    results = HTTParty.get(url)
    parsed_results = JSON.parse(results.body)
    @results = parsed_results.map do |result|
      {
        full_name: result["first_name"] + " " + result["last_name"],
        first_name: result["first_name"],
        last_name: result["last_name"],
        weight_class: result["weight_class"],
        wins: result["wins"],
        losses: result["losses"],
        draws: result["draws"],
        status: result["fighter_status"],
        title_holder: result["title_holder"],
        image: result["thumbnail"],
        belt_thumbnail: result["belt_thumbnail"]
      }
    end

  end

  def results
    url = "http://ufc-data-api.ufc.com/api/v1/us/fighters"
    results = HTTParty.get(url)
    parsed_results = JSON.parse(results.body)
    @results = parsed_results.map do |result|
      {
        full_name: result["first_name"] + " " +  result["last_name"],
        weight_class: result["weight_class"],
        wins: result["wins"],
        losses: result["losses"],
        draws: result["draws"],
        status: result["fighter_status"],
        title_holder: result["title_holder"],
        image: result["thumbnail"],
        belt_thumbnail: result["belt_thumbnail"]
      }
    end
    @params = params[:search]
    @data = []
    @results.each do |result|
      if result.has_value?(@params)
        @data << result
      end
    end

  end



end
