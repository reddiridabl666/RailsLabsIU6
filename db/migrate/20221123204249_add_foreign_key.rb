class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_column :euclid_steps, :euclid_result_id, :integer
    add_foreign_key :euclid_steps, :euclid_results
  end
end
