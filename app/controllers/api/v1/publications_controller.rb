module Api::V1
  class PublicationsController < ApiController
      before_action :authenticate
        def index
        @publications = Publication.all.select(:content, :user_id)
        end
        def create
            @publication = Publication.new(content: params[:content])
            @publication.user = @current_user
            unless @publication.save
                render json: { errors: @publication.errors }, status: :unprocessable_entity
            end
        end

    end
  end
