class AddDateToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :date, :date
  end
end
