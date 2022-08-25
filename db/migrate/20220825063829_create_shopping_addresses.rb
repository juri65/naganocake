class CreateShoppingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_addresses do |t|
    t.integer :customer_id
    t.string :postcode
    t.string :name
    t.string :address

      t.timestamps
    end
  end
end
