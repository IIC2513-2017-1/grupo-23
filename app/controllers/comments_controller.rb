class CommentsController < ApplicationController
  include Secured
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :find_publication

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.publication_id = @publication.id
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to publications_path, notice: 'Comentario creado.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to publications_path, notice: 'Comentario editado.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to publications_path, notice: 'Comentario destruido.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def find_publication
      @publication = Publication.find(params[:publication_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end