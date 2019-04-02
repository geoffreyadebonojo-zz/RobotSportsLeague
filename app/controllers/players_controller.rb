class PlayersController < ApplicationController

  def edit
    @player = current_user.players.where("player_id = ?", params[:player_id]).first

    if params[:on_team]
      @player.on_team = params[:on_team]
      @player.status = "unassigned"
      @player.save
      redirect_to pool_path
    end

    if params[:status]
      @player.status = params[:status]
      @player.save
      redirect_to roster_path
    end

  end

end
