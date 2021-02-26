class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :title,       null: false
      t.integer    :price,       null: false
      t.references :user,        null: false, foreign_key: true
      t.text       :catch_copy,  null: false
      t.integer    :category_id, null: false
      t.integer    :state_id,    null: false
      t.integer    :postage_id,  null: false
      t.integer    :address_id,  null: false
      t.integer    :delivery_id,     null: false

      t.timestamps
    end
  end
end
