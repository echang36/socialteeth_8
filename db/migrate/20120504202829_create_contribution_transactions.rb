class CreateContributionTransactions < ActiveRecord::Migration
  def change
    create_table :contribution_transactions do |t|
      t.integer :contribution_id
      t.integer :amount
      t.boolean :success
      t.string :reference
      t.string :message
      t.string :action
      t.text :params
      t.boolean :test

      t.timestamps
    end
  end
end
