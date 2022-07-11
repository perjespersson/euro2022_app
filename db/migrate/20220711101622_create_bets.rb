class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.integer :game_id
      t.string :bet

      t.timestamps
    end
  end
end
