# Module for securing controllers access
module Secured
  extend ActiveSupport::Concern

  ##
  # Verify if current_user is logged_in
  def logged_in?
    redirect_to(root_path, notice: 'Unauthorized access!') unless current_user
  end

  def valid_action(id)
    redirect_back(fallback_location: root_path, notice: 'Unauthorized access!')  unless (current_user.try(:id) == id || is_admin)
    true
  end



end
