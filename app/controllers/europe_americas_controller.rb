class EuropeAmericasController < ApplicationController

    def index
        europe_america = EuropeAmerica.all
        render json: europe_america
      end
end
