class SessionController < ApplicationController
  def new
  end

  def create
    team = Team.find_by(email: params[:email])
    if team && team.authenticate(params[:email])
      session[:team_id] = team.id
      redirect_to roster_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Thank you! You have been logged out."
    redirect_to home_path
  end

end
