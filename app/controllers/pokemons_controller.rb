class PokemonsController < ApplicationController
  # GET /pokemons or /pokemons.json
  def index
    # @pokemen = Pokemon.all
    @pokemen = Pokemon.order(:id).page(params[:page]).per(40)
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
