class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :series
      t.integer :volume
      t.boolean :on_display

      t.timestamps
    end
  end
end
