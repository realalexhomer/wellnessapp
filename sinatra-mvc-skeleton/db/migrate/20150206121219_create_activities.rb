class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.string :completed?, :default => false
      t.string :description
      t.integer :points, :default => 0

      t.references :user
    end
  end
end
