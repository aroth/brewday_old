class BreweriesController < ApplicationController
  
  def show
    @brewery = Brewery.find( params[:id] )
  end
  
end