class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all 
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

    respond_to do |format|
      if @tournament.save
        team = params[:tournament][:team_ids]
        (1..6).each do |x|
          (x + 1..6).each do |y|
            Match.create(date:"00/00/0000 ",tournament_id: Tournament.last.id,visitor_id:Team.find(team[x]).id, local_id:Team.find(team[y]).id)
          end
        end
        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      
      if @tournament.update(tournament_params)
        team = params[:tournament][:team_ids]
        @tournament.matches.each do |l|
          l.destroy
        end
        (1..6).each do |x|
          (x + 1..6).each do |y|
            Match.create(date:"00/00/0000 ",tournament_id: Tournament.last.id,visitor_id:Team.find(team[x]).id, local_id:Team.find(team[y]).id)
          end
        end
        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :user_id)
    end
end
