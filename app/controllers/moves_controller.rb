class MovesController < ApplicationController
  before_action :set_move, only: %i[ show edit update destroy ]

  # GET /moves or /moves.json
  def index
    # @moves =  Move.order(:id).page(params[:page]).per(100)
    @q = Move.ransack(params[:q])
    @moves = @q.result.order(:id).page(params[:page]).per(100)
  end

  # GET /moves/1 or /moves/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_move
    @move = Move.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def move_params
    params.require(:move).permit(:id, :name, :accuracy, :pp, :power, :damage_class, :priority, :move_type, :type_id)
  end
end
