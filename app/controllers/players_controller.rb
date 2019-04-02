class PlayersController < ApplicationController

  def edit
    @player = current_user.players.where("player_id = ?", params[:player_id]).first

    if params[:on_team] == 'true'
      @player.on_team = true
      @player.status = "unassigned"
      @player.save
      redirect_to pool_path
    end

    if params[:on_team] == 'false'
      @player.on_team = false
      @player.status = "free"
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
