class CreateTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.text :explain
      t.boolean :like
      t.references :gword, foreign_key: true
      t.references :vword, foreign_key: true

      t.timestamps
    end
  end
end
