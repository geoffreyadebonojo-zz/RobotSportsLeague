class RostersController < ApplicationController

  def index
    @roster = current_user.roster.order(name: :desc)
  end

end
