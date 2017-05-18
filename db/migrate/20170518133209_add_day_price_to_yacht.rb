class AddDayPriceToYacht < ActiveRecord::Migration[5.0]
  def change
    add_column :yachts, :day_price, :integer
  end
end
