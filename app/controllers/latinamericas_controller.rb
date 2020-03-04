class LatinamericasController < ApplicationController
  

  # GET /latinamericas
  def index
    latinamericas = Latinamerica.all
    
    render json: latinamericas
  end

end
