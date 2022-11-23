class CreateEuclidSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :euclid_steps do |t|
      t.integer :step
      t.integer :first
      t.integer :second

      t.timestamps
    end
  end
end
