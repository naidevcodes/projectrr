class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  
  private
    def current_user
      warden.user
    end
    helper_method :current_user
    
    def authorize
      redirect_to sign_in_url, alert: "You must be signed in to do that!" if current_user.nil?
    end
    
    def warden
      env['warden']
    end
end
