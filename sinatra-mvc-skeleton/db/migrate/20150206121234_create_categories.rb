class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.references :alignment, null: false
    end
  end
end
