class FighterDatumController < ApplicationController

  def initialize

end

  def search
    url = "http://ufc-data-api.ufc.com/api/v1/us/fighters"
    results = HTTParty.get(url)
    parsed_results = JSON.parse(results.body)
    @results = parsed_results.map do |result|
      {
        full_name: result["first_name"] + result["last_name"],
        first_name: result["first_name"],
        last_name: result["last_name"],
        wins: result["wins"],
        losses: result["losses"],
        weight_class: result["weight_class"],
        image: result["thumbnail"]
      }
    end

  end

  def results
    url = "http://ufc-data-api.ufc.com/api/v1/us/fighters"
    results = HTTParty.get(url)
    parsed_results = JSON.parse(results.body)
    @results = parsed_results.map do |result|
      {
        full_name: result["first_name"] + result["last_name"],
        first_name: result["first_name"],
        last_name: result["last_name"],
        wins: result["wins"],
        losses: result["losses"],
        weight_class: result["weight_class"],
        image: result["thumbnail"]
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
