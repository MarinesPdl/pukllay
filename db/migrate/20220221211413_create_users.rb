class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :user_phone_number
      t.string :role

      t.timestamps
    end
  end
end
