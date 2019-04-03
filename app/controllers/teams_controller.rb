class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :destroy, :edit, :update]

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(create_params)

    if @team.save
      session[:team_id] = @team.id
      redirect_to roster_path, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def update
    if @team.update(patch_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private
    def set_team
      @team = Team.find(session[:team_id])
    end

    def create_params
      params.require('/registration').permit(:name, :email, :password, :password_confirmation)
    end

    def patch_params
      params.require(:team).permit(:name, :email, :password, :password_confirmation)
    end
end
