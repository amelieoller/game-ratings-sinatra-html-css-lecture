class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.integer :rating
      t.integer :user_id
    end
  end
end
