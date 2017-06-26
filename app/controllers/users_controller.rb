class UsersController < ApplicationController
  include Secured
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: %i[edit update destroy]
  before_action :is_current_user?, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user.generate_token_and_save
        UserMailer.new_user_email(@user).deliver_later
        format.html { redirect_to @user, notice: 'Usuario creado' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: 422 }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team_id = @user.team_id
    respond_to do |format|
      if @user.update(user_params)
        if @team_id != @user.team_id
          UserMailer.new_seguidor_email(@user.team, @user).deliver_later
        end

        format.html { redirect_to @user, notice: 'Usuario editado' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :lastname, :email, :password,
      :password_confirmation, :juega, :team_id)
    end

    def is_current_user?
      unless @user == current_user
        redirect_to(root_path, alert: '¡Acceso no autorizado!')
      end
    end
end
