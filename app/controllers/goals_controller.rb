class GoalsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        goal = Goal.new(match_id:params[:match_id], user_id: params[:user_id], cantidad:params[:cantidad])
        goal.save
        redirect_to match_path(Match.find(params[:match_id]))
    end
    def update
        goal = Goal.find(params[:goal_id]).update(cantidad:params[:cantidad])
        redirect_to match_path(Match.find(params[:match_id]))
    end
end
