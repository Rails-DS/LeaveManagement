class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		if @team.save!
			redirect_to teams_path
		else
			render 'new'
		end
	end

	def edit
		@team = Team.find(params[:id])
	end


	def update
		@team = Team.find(params[:id])
		if @team.update!(team_params)
			redirect_to teams_path
		else
			redirect_to edit_team_path
		end
	end


	def destroy 
		@team = Team.find(params[:id])
		if @team.destroy!
			redirect_to teams_path
		end
	end



  	private

  	def team_params
    	params.require(:team).permit(:teamName, :teamLeader)
  	end
end
