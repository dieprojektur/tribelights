module ApplicationHelper
  def after_sign_in_path_for(resource)
    root_url
  end
end
