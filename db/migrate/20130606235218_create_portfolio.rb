class CreatePortfolio < ActiveRecord::Migration
  def up
    create_table :portfolios do |t|
      t.integer :client_id
    end
  end

  def down
    drop_table :portfolios
  end
end
