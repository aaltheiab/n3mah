class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  def current_user
    if session[:phone_number]
      User.find_by(phone_number: session[:phone_number])
    else
      nil
    end
  end

end
