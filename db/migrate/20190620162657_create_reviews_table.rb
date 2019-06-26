class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :user_id
      t.integer :game_id
    end
  end
end
