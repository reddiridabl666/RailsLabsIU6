class UniqueVals < ActiveRecord::Migration[7.0]
  def change
    add_index :euclid_results, [:first, :second], unique: true
  end
end
