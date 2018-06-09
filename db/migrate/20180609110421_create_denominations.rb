class CreateDenominations < ActiveRecord::Migration[5.2]
  def change
    create_table :denominations do |t|
      t.integer :sku_denomination
      t.text :sku_combination

      t.timestamps
    end
  end
end
