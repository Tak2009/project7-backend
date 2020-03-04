class LatinamericasController < ApplicationController
  
  def index
    latinamericas = Latinamerica.all
    render json: latinamericas
  end

end
