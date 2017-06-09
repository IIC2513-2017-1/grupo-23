module Secured
  extend ActiveSupport::Concern

  def logged_in?
    redirect_to(new_session_path, alert: '¡Debes ingresar!') unless current_user
  end
end
