class PlayerPoolsController < ApplicationController

  def index
    @available_players = current_user.players
    @players_on_team = current_user.roster.count
  end

end
