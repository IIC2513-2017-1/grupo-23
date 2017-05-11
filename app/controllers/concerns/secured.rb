module Secured
  extend ActiveSupport::Concern

  def logged_in?
    redirect_to(root_path, notice: '¡Acceso no autorizado!') unless current_user
  end
end
