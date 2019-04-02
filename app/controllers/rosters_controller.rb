class RostersController < ApplicationController

  def index
    @roster = current_user.roster.order(name: :desc)

    if params[:sort] == "name"
      @roster = current_user.roster.sort_by_name
    elsif params[:sort] == "player_id"
      @roster = current_user.roster.sort_by_player_id
    elsif params[:sort] == "strength"
      @roster = current_user.roster.sort_by_strength
    elsif params[:sort] == "speed"
      @roster = current_user.roster.sort_by_speed
    elsif params[:sort] == "agility"
      @roster = current_user.roster.sort_by_agility
    elsif params[:sort] == "stats_total"
      @roster = current_user.roster.sort {|a,b| b.stats_total <=> a.stats_total}
    end
  end
end
