class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :photo
      t.integer :points_total, :default => 0
    end
  end
end
