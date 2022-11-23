class EuclidResult < ApplicationRecord
  validates :first, uniqueness: { scope: :second }
  has_many :euclid_steps

  def self.get(first, second)
    result = self.find_by(first: first, second: second)
    result = self.find_by(first: second, second: first) if result.blank?
    return [result.euclid_steps.all, result.gcd, result.lcm] unless result.blank?

    generate_result(first, second)
  end

  def self.generate_result(first, second)
    steps, gcd, lcm = euclid_algorithm(first, second)

    res = self.create(first: first, second: second, gcd: gcd, lcm: lcm)

    # p steps

    steps.each do |arr, index|
      EuclidStep.create(euclid_result_id: res.id, step: index,
                        first: arr[0], second: arr[1])
    end

    [steps, gcd, lcm]
  end

  def self.euclid_algorithm(first, second)
    results = euclid_enumerator(first, second)
              .each_with_index
              .take_while {|res, _| [res[0], res[1]].min != 0 }

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

  private_class_method :generate_result, :euclid_enumerator, :euclid_algorithm
end
