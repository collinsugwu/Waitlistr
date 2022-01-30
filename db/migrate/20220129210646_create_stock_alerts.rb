class CreateStockAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_alerts do |t|
      t.references(:stock_symbol, foreign_key: true, nullable: true)
      t.integer :high
      t.integer :low
      t.integer :close
      t.datetime :date
      t.timestamps
    end
  end
end
