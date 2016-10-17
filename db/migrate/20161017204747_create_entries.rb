class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :Word :limit => 64, :null => false
      t.string :Translate
      t.text :Explanation

      #t.timestamps
    end
  end
end
