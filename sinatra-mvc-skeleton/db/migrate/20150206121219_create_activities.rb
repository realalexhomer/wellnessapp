class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.string :description
      t.integer :points

      t.references :user
    end
  end
end
