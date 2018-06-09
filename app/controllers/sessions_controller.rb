class SessionsController < Devise::SessionsController
  # def new
  #   super
  # end
  #
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_navigational_format?
  #   sign_in(resource_name, resource)
  #   if !session[:return_to].blank?
  #     redirect_to session[:return_to]
  #     session[:return_to] = nil
  #   else
  #     respond_with resource, :location => after_sign_in_path_for(resource)
  #   end
  # end

  def callback
  if user = User.from_omniauth(env["omniauth.auth"])
    flash[:success] = 'Signed in by Facebook successfully'
    session[:user_id] = user.id
    redirect_to root_path
  else
    flash[:error] = "Error while signing in by Facebook. Let's register"
    redirect_to new_user_path
  end
end

end
