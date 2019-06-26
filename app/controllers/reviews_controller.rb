class ReviewsController < ApplicationController
	get '/reviews/new' do
		erb :'/reviews/new'
	end

	post '/reviews' do
		game = Game.new(title: params[:game][:title], description: params[:game][:description], image_url: params[:game][:image_url], rating: params[:game][:rating])

		game.user = current_user

		params[:game][:reviews].each do |review_details|
			review = Review.new(review_details)
			review.user = current_user
			review.game = game

			review.save
		end

		game.save
		redirect "/games"
	end
end
