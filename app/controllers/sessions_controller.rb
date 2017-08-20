class SessionsController < Devise::SessionsController

protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.banned?
      sign_out resource
      flash[:alert] = "Konto użytkownika zostało zbanowane"
      root_path
    else
      super
    end
   end

end

