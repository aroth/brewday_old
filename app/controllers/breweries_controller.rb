class BreweriesController < ApplicationController
  
  def show
    @brewery = Brewery.find( params[:id] )
    @brew_days = @brewery.brew_days
    @recipes = @brewery.recipes
  end
  
end