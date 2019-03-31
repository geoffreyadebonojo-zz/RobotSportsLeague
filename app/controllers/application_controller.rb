class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @current_user ||= Team.find(session[:team_id]) if session[:team_id]
  end

end
