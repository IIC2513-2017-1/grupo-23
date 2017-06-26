module Api::V1
  class TeamsController < ApiController
    before_action :authenticate

    def index
      @teams = Team.all
    end
    def show
      @team = Team.find(params[:id])
    end
  end
end