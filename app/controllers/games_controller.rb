class GamesController < ApplicationController
	get '/games' do
		@games = Game.all
		erb :'/games/index'
	end

	get '/games/new' do
		erb :'/games/new'
	end

	get '/games/:id/edit' do
		@game = Game.find(params[:id])
		erb :'/games/edit'
	end

	get '/games/:id' do
		@game = Game.find(params[:id])
		erb :'/games/show'
	end

	post '/games' do
		# @game = Game.create(title: params[:title], description: params[:description])
		@game = Game.create(params)
		@game.user = current_user
		@game.save

		redirect "/games"
	end

	patch '/games/:id' do
		@game = Game.find(params[:id])
		
		if @game.user_id == current_user.id && params[:title] != "" && params[:description] != "" && params[:image_url] != "" && params[:rating] != ""
			@game.update(title: params[:title], description: params[:description], image_url: params[:image_url], rating: params[:rating])

			redirect "/games/#{@game.id}"
    else
      redirect "users/#{current_user.id}"
    end
	end
	
  delete '/games/:id' do
		@game = Game.find(params[:id])
		@game.destroy

		redirect "games"		
  end
end
