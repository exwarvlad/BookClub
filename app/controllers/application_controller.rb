class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :go_out

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, :email
    ])
  end

  def go_out
    if Rails.env.production?
      uri = URI(request.url)

      if uri.host == '52.38.206.116'
        uri.host = 'booksclub.tk'
        redirect_to uri.to_s
      end
    end
  end
end
