require 'rails_helper'

RSpec.describe EuclidStep, type: :model do
  it "validates uniqueness" do
    EuclidStep.create(euclid_result_id: 1, step: 1)
    expect(EuclidStep.create(euclid_result_id: 1, step: 1).valid?).to eq false
  end
end
