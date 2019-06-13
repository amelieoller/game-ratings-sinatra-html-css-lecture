class UsersController < ApplicationController

	get '/signup' do
    erb :signup
	end
	
	get '/login' do
		erb :login
	end

	get '/users/:id' do
		@user = User.find_by(id: params[:id])
		erb :'/users/show'
	end

	post '/users' do

	end

	post '/login' do

  end

	get '/logout' do
		redirect '/'
	end

end