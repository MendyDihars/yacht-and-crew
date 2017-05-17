class RemoveRatingFromYacht < ActiveRecord::Migration[5.0]
  def change
    remove_column :yachts, :rating, :integer
  end
end
