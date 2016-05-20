class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :set_locale
  
  def default_url_options(options = {})
    {locale: I18n.locale}
  end
  
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
    
    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
    end
end
