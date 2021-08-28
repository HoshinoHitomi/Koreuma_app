class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource

    when Admin
      admin_root_path

    when Shop
      root_path

    when User
      root_path

    end
  end

  def after_sign_out_path_for(resource)

      new_admin_session_path
  end
end
