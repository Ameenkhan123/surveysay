class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
 after_action :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

protected

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end
  

  protected  
    def after_sign_in_path_for(resource)
      # sign_in_url = new_user_session_url
      # if request.referer == sign_in_url
      #   super
      # else
      #   stored_location_for(resource) || request.referer || root_path
      # end

      if resource.admin 
        surveys_path
      else
        root_path
      end 
    end
end
