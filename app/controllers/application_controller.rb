class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  

# def hello
# 	render html:'Hell World'
# end

include SessionsHelper
include UsersHelper

end
