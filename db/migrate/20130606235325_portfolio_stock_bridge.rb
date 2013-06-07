class PortfolioStockBridge < ActiveRecord::Migration
  def up
    create_table :portfolios_stocks do |t|
      t.integer :portfolio_id
      t.integer :stock_id
    end
  end

  def down
    drop_table :portfolios_stocks
  end
end
