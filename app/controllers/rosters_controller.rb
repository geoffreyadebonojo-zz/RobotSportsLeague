class RostersController < ApplicationController

  def index
    @roster = current_user.roster.order(:id)
  end

  def edit
    if params[:cmd]
      @roster = current_user.auto_select_players
      redirect_to roster_path
    end
  end

end
