class AddGwordIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :gword_id, :integer
  end
end
