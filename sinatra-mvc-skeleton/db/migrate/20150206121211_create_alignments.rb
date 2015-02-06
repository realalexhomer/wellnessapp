class CreateAlignments < ActiveRecord::Migration
  def change
    create_table :alignments do |t|
      t.string :name, null: false
    end
  end
end
