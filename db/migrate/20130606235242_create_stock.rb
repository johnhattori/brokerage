class CreateStock < ActiveRecord::Migration
  def up
    create_table :stocks do |t|
      t.string :symbol
    end
  end

  def down
    drop_table :stocks
  end
end
