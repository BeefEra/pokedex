class MovesController < ApplicationController
  # GET /moves or /moves.json
  def index
    @q = Move.joins(:type).where("types.name LIKE ?", "%#{params.dig('q', 'type_name')}%").ransack(params[:q])
    @moves = @q.result(distinct: true).order(:id).page(params[:page]).per(100)
  end

  # GET /moves/1 or /moves/1.json
  def show
    @move = Move.find(params[:id])
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
