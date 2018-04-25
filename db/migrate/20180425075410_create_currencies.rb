class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :parent_code, unique: true, index: true, null: false

      t.string :num_code
      t.string :char_code

      t.string :name
      t.string :eng_name

      t.decimal :value, precision: 10, scale: 4

      t.decimal :forced_value, precision: 10, scale: 4
      t.datetime :forced_expiriation_at

      t.timestamps null: false
    end
  end
end
