require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "game_rating_app"
  end

  get "/" do
    erb :welcome
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
