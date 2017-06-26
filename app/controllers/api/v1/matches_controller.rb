module Api::V1
  class MatchesController < ApiController
    def show
      @match = Match.find(params[:id])
    end
  end
end