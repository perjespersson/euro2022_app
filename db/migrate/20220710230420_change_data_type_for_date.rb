class ChangeDataTypeForDate < ActiveRecord::Migration[7.0]
  def change
    change_column :games, :date, :datetime
  end
end
