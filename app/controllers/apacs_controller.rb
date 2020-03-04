class ApacsController < ApplicationController

    def index
        apacs = Apac.all
        render json: apacs
    end

end
