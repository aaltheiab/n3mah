class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_ar_locale

  def current_user
    if session[:phone_number]
      User.find_by(phone_number: session[:phone_number])
    else
      nil
    end
  end


  private

  def set_ar_locale
    I18n.locale = :ar
  end

end
