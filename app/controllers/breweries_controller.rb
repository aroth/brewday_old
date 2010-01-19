class BreweriesController < ApplicationController
  
  def show
    @brewery = Brewery.find( params[:id] )
    @batches = @brewery.batches
    @recipes = @brewery.recipes
    @styles = @brewery.beer_styles
  end
  
end