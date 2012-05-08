class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :user_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
