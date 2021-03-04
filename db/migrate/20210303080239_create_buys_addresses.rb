class CreateBuysAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buys_addresses do |t|
      t.string :telephone,      null: false
      t.string :postcode,       null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :block,          null: false
      t.string :building
      t.references :buy,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
