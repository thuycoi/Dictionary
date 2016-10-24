class CreateVwords < ActiveRecord::Migration[5.0]
  def change
    create_table :vwords do |t|
      t.string :wort

      t.timestamps
    end
  end
end
