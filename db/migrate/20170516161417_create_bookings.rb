class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :yacht, foreign_key: true
      t.integer :guest_number
      t.integer :rating
      t.date :checkin
      t.date :checkout
      t.string :price

      t.timestamps
    end
  end
end
