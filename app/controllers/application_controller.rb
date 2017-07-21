class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :banned?
 

  
  helper_method :mailbox, :conversation



  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:error] = "Konto użytkownika zostało zablokowane"
      root_path
    end
  end

private

def mailbox
 	@mailbox ||= current_user.mailbox
end


 def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
 end

  protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
      end
end
