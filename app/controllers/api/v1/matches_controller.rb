module Api::V1
  class MatchesController < ApiController
    before_action :authenticate
    def show
      @match = Match.find(params[:id])
    end
  end
end