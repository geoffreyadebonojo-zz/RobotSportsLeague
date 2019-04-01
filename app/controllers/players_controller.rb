class PlayersController < ApplicationController

  def edit
    @player = current_user.players.where("player_id = ?", params[:player_id]).first
    @player.on_team = params[:on_team]
    @player.status = "unassigned"
    @player.save
    redirect_to pool_path
  end

end
