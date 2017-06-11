class TournamentsController < ApplicationController
  include Secured
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  before_action :is_current_user?, only: [:edit ,:update ,:destroy]
  before_action :logged_in?, only: %i[new create edit update destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all.order(:user_id)
    if params.has_key?(:user_id)
      @tournaments = Tournament.where(user_id: params[:user_id])
    end
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    @tournament.user = current_user
    if params[:tournament][:team_ids].size == 7
      respond_to do |format|
        if @tournament.save
          team = params[:tournament][:team_ids]
          @tournament.team_ids = team
          (1..6).each do |x|
            (x + 1..6).each do |y|
              if [0, 1].sample == 1
                Match.create(date:"00/00/0000 ",tournament_id: Tournament.last.id,visitor_id:Team.find(team[x]).id, local_id:Team.find(team[y]).id)
              else
                Match.create(date:"00/00/0000 ",tournament_id: Tournament.last.id,visitor_id:Team.find(team[y]).id, local_id:Team.find(team[x]).id)
              end
            end
          end
          format.html { redirect_to @tournament, notice: 'Torneo creado' }
          format.json { render :show, status: :created, location: @tournament }
        else
          format.html { render :new }
          format.json { render json: @tournament.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @tournament, notice: 'Ingrese sólo 6 partidos'
    end

  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    if params[:tournament][:team_ids].size == 7
      respond_to do |format|

        if @tournament.update(tournament_params)
          team = params[:tournament][:team_ids]
          @tournament.matches.each do |l|
            l.destroy
          end
          @tournament.team_ids = team
          (1..6).each do |x|
            (x + 1..6).each do |y|
              if [0, 1].sample == 1
                Match.create(date:"00/00/0000 ",tournament_id: Tournament.last.id,visitor_id:Team.find(team[x]).id, local_id:Team.find(team[y]).id)
              else
                Match.create(date:"00/00/0000 ",tournament_id: Tournament.last.id,visitor_id:Team.find(team[y]).id, local_id:Team.find(team[x]).id)
              end  
            end
          end
          format.html { redirect_to @tournament, notice: 'Torneo editado' }
          format.json { render :show, status: :ok, location: @tournament }
        else
          format.html { render :edit }
          format.json { render json: @tournament.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to edit_tournament_path(@tournament), notice: 'Ingrese sólo 6 partidos'
    end

  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.matches.each do |m|
      m.destroy
    end
     @tournament.participates.each do |p| p.destroy end
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Torneo eliminado' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name)
    end

    def is_current_user?
      unless Tournament.find(params[:id]).user == current_user
        redirect_to(tournaments_path, alert: '¡Acceso no autorizado!')
      end
    end
end
