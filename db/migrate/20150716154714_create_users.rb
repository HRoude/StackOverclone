class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :location
      t.string :knowledge
      t.integer :votes, default: 0
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
