class AddSlugToStockSymbols < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_symbols, :slug, :string
    add_index :stock_symbols, :slug, unique: true
  end
end
