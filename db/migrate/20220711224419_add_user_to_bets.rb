class AddUserToBets < ActiveRecord::Migration[7.0]
  def change
    add_column :bets, :user_id, :integer
  end
end
