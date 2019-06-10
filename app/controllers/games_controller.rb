class GamesController < ApplicationController

	get '/games' do
		@games = Game.all
		erb :'/games/index'
	end

	get '/games/new' do
		erb :'/games/new'
	end

	post '/games' do
		@game = Game.create(title: params[:title], description: params[:description])

		redirect "/games"
	end

end
