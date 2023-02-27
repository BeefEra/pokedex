class PokemonsController < ApplicationController
  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  private
  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:id, :name)
  end
end
