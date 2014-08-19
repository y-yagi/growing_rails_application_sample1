class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :account_id, null: :false
      t.integer :type, null: :false

      t.timestamps
    end
  end
end
