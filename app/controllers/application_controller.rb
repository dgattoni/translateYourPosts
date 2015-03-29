class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #callback llamara a metodo set_locale
  before_action :set_locale


 #metodo en donde seteamos los idiomas   
 def set_locale
 	I18n.locale = params[:locale] || 
 	extract_locale_from_accept_language_header ||
 	I18n.default_locale
 end

  #para que el parametro no se pase como query string sino como parte de la URL.
  def default_url_options (options={})
   {locale: I18n.locale}   
 end


 private
 def extract_locale_from_accept_language_header
   locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      #si el resultado que entrega incluye español o ingles que lo considere. si es otro q no lo considere.
      locale if ['es','en'].include? locale.to_s
    end


  end
