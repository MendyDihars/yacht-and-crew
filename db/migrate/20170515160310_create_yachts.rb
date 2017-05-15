class CreateYachts < ActiveRecord::Migration[5.0]
  def change
    create_table :yachts do |t|
      t.string :name
      t.string :crew
      t.string :description
      t.string :location
      t.integer :rating
      t.integer :max_capacity

      t.timestamps
    end
  end
end
