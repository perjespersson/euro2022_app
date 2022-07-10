class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :home_team_id
      t.string :away_team_id
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end
  end
end
