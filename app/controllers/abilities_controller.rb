class AbilitiesController < ApplicationController
  # GET /abilities or /abilities.json
  def index
    # @abilities = Ability.all
    @q = Ability.ransack(params[:q])
    @abilities = @q.result.order(:id).page(params[:page]).per(100)
  end

  # GET /abilities/1 or /abilities/1.json
  def show
    @ability = Ability.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ability
    @ability = Ability.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ability_params
    params.require(:ability).permit(:id, :name, :effect)
  end
end
