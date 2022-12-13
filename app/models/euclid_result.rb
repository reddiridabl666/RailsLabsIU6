# frozen_string_literal: true

# results of euclid algorithm
class EuclidResult < ApplicationRecord
  validates :first, uniqueness: { scope: :second }
  validates :first, :second, :gcd, :lcm, presence: true
  validate :unique_pair, on: :create

  has_many :euclid_steps

  def self.get(first, second)
    result = find_by(first:, second:)
    result = find_by(first:, second:) if result.blank?
    return [result.euclid_steps.all.order(:step), result.gcd, result.lcm] unless result.blank?

    generate_result(first, second)
  end

  def self.get_json(first, second)
    response_to_json(*get(first, second))
  end

  def to_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.result do
        xml.id id
        xml.gcd gcd
        xml.lcm lcm
        xml.steps do
          euclid_steps.all.each do |step|
            xml.step do
              xml.id step.id
              xml.first step.first
              xml.second step.second
            end
          end
        end
      end
    end.doc.root.to_xml
  end

  private

  def unique_pair
    errors.add(:already_calculated, 'results for such numbers') unless
      EuclidResult.find_by(first: second, second: first).nil?
  end

  def self.generate_result(first, second)
    steps, gcd, lcm = euclid_algorithm(first, second)

    res = create(first:, second:, gcd:, lcm:)

    step_objects = steps.reduce([]) do |sum, step|
      step_res, index = step
      sum.push(EuclidStep.create(euclid_result_id: res.id, step: index,
                                 first: step_res[0], second: step_res[1]))
    end

    [step_objects, gcd, lcm]
  end

  def self.euclid_algorithm(first, second)
    results = euclid_enumerator(first, second)
              .each_with_index
              .take_while { |res, _| [res[0], res[1]].min != 0 }

    gcd = results.blank? ? first : results[-1][0].max
    lcm = first * second / gcd

    [results, gcd, lcm]
  end

  def self.euclid_enumerator(first, second)
    Enumerator.new do |yielder|
      loop do
        yielder << if first < second
                     [first, second -= first]
                   else
                     [first -= second, second]
                   end
      end
    end
  end

  def self.response_to_json(res_steps, gcd, lcm)
    ActiveSupport::JSON.encode(
      { steps: res_steps,
        gcd:,
        lcm: }
    )
  end

  private_class_method :generate_result, :euclid_enumerator,
                       :euclid_algorithm, :response_to_json
end
