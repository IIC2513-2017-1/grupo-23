module Api::V1
  class TournamentsController < ApiController

    before_action :authenticate
    def index
      @tournaments = Tournament.all.order(:user_id)
    end
    def show
      @tournament = Tournament.find(params[:id])
    end
  end
end