class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :city
      t.boolean :open
      t.integer :income_rank

      t.timestamps
    end
  end
end
