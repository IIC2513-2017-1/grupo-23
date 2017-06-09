class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Ingreso exitoso'
    else
      redirect_to(new_session_path, alert: 'Correo o clave incorrectas')
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Salida de sesión exitosa'
  end
end
