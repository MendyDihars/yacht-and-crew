class AddOwnerToYachts < ActiveRecord::Migration[5.0]
  def change
    add_reference :yachts, :owner, references: :users, index: true
  end
end
