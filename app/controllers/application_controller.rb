class ApplicationController < ActionController::Base
  before_filter :set_locale
  
  protect_from_forgery
  include SessionsHelper
  
  def set_locale
    if params[:locale] && ["pt"].include?(params[:locale])
      I18n.locale = params[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end
end
