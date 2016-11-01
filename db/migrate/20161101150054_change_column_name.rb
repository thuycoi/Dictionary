class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  rename_column :comments, :gword_id_id, :gword_id
  end
end
