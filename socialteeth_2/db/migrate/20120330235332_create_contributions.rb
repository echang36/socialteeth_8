class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :user
      t.references :ad
      t.decimal :amount

      t.timestamps
    end
    add_index :contributions, :user_id
    add_index :contributions, :ad_id
  end
end
