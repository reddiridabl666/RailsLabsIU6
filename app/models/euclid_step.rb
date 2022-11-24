class EuclidStep < ApplicationRecord
  belongs_to :euclid_result
  validates :step, uniqueness: { scope: :euclid_result_id }
end
