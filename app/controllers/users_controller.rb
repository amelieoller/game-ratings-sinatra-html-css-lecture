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
		@user = User.find_by(email: params[:email])

		if @user
			redirect '/login'
		else
			@user = User.create(email: params[:email], password: params[:password])
			if @user.save
				session[:user_id] = @user.id
				redirect "/users/#{@user.id}"
			else
				erb :signup
			end
		end
	end

	post '/login' do
		@user = User.find_by(email: params[:email])
		
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect "games"
    else
      redirect '/login'
    end
  end

	get '/logout' do
		session.clear
		redirect '/'
	end

end