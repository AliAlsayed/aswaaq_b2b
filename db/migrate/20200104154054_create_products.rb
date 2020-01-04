class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :barcode
      t.string :itemno
      t.float :price
      t.references :product_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
