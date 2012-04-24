class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.integer :ad_id
      t.integer :user_id
      t.decimal :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
