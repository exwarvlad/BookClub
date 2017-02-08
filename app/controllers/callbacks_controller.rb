class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authenticate_omniautch
  end

  def vkontakte
    authenticate_omniautch
  end

  private

  def authenticate_omniautch
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
