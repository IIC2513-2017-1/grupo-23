class PublicationsController < ApplicationController
  include Secured
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: %i[new create edit update destroy]


  def index
    @publications = Publication.includes(:user)
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    respond_to do |format|
      if @publication.save
        format.html { redirect_to publications_path, notice: 'Publicación creada' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to publications_path, notice: 'Publicación editada' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publicación eliminada' }
      format.json { head :no_content }
    end
  end

  private
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def publication_params
      params.require(:publication).permit(:content, :image).merge(user_id: current_user.id)
    end
end
