class CreateStockSymbols < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_symbols do |t|
      t.references(:wallet, foreign_key: true, nullable: true)
      t.string :name, index: {unique: true}
      t.integer :high
      t.integer :low
      t.timestamps
    end
  end
end
