class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include DeviseConcern
  include PunditConcern
  include Pundit
end
