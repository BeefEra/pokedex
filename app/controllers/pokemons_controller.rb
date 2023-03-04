class PokemonsController < ApplicationController
  # GET /pokemons or /pokemons.json
  def index
    @q = Pokemon.joins(:types).where("types.name LIKE ?", "%#{params.dig('q', 'type_name')}%").ransack(params[:q])
    @pokemen = @q.result(distinct: true).order(:id).page(params[:page]).per(40)
  end

  # GET /pokemons/1 or /pokemons/1.json
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  private
  # Only allow a list of trusted parameters through.
  def pokemon_params
    params.require(:pokemon).permit(:id, :name, :type_name, :type)
  end
end
