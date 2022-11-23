class CreateEuclidResults < ActiveRecord::Migration[7.0]
  def change
    create_table :euclid_results do |t|
      t.integer :first
      t.integer :second
      t.integer :gcd
      t.integer :lcm

      t.timestamps
    end
  end
end
