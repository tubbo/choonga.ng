class ApplicationController < ActionController::Base
  include LinkFinder

  protect_from_forgery
end
