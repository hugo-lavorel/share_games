class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :category
      t.integer :player_min
      t.integer :player_max
      t.string :condition
      t.integer :price_per_day

      t.timestamps
    end
  end
end
