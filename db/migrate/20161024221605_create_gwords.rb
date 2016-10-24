class CreateGwords < ActiveRecord::Migration[5.0]
  def change
    create_table :gwords do |t|
      t.string :word
      t.date :date

      t.timestamps
    end
  end
end
