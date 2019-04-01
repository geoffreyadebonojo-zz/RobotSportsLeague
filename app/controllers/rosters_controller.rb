class RostersController < ApplicationController

  def index
    @roster = current_user.roster
  end

end
