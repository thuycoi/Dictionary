class ChangeColumnName2 < ActiveRecord::Migration[5.0]
  def change
  rename_column :comments, :gword, :gword_id
  end
end
