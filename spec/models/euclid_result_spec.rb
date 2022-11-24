require 'rails_helper'

RSpec.describe EuclidResult, type: :model do
  it "adds records to db" do
    EuclidResult.create(first: 3, second: 2, gcd: 1, lcm: 6)
    found = EuclidResult.find_by(first: 3, second: 2)
    expect(found).not_to be_nil

    expect(found.first).to eq 3
    expect(found.second).to eq 2

    expect(found.gcd).to eq 1
    expect(found.lcm).to eq 6
  end

  it "validates uniqueness" do
    EuclidResult.create(first: 3, second: 2, gcd: 1, lcm: 6)

    record = EuclidResult.create(first: 3, second: 2, gcd: 1, lcm: 6)
    expect(record.valid?).to eq false

    record = EuclidResult.create(first: 2, second: 3, gcd: 1, lcm: 6)
    expect(record.valid?).to eq false
  end

  it "validates presence" do
    record = EuclidResult.create(first: 3, second: 2)
    expect(record.valid?).to eq false
  end

  it 'creates corresponding steps' do
    EuclidResult.get(24, 16)
    res = EuclidResult.find_by(first: 24, second: 16)
    expect(res.euclid_steps.many?).to eq true
  end
end
