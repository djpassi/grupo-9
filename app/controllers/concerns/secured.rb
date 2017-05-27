# Module for securing controllers access
module Secured
  extend ActiveSupport::Concern

  ##
  # Verify if current_user is logged_in
  def logged_in?
    redirect_to(root_path, notice: 'Unauthorized access!') unless current_user
  end

  def valid_action(id)
    redirect_back(fallback_location: root_path, notice: 'Unauthorized access!!!!') unless ((current_user.try(:id) == id) || is_admin)
  end

  def valid_comment_action(id)
    comment = Comment.find(id)
    user_current = current_user.try(:id)
    redirect_back(fallback_location: root_path, notice: 'Unauthorized access!') unless (user_current == Project.find(comment.project_id).user_id || is_admin || comment.user_id == user_current)
    true
  end

end
