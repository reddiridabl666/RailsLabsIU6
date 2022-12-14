# frozen_string_literal: true

# main controller
class EuclidController < ApplicationController
  before_action :validate_input, only: :result

  def index; end

  def result
    @first_num = params[:input1].to_i
    @second_num = params[:input2].to_i

    @results, @gcd, @lcm = euclid_algorithm
  end

  private

  def euclid_algorithm
    results = euclid_enumerator(@first_num, @second_num)
              .each_with_index
              .take_while { |res, _| [res[0], res[1]].min != 0 }

    gcd = results.blank? ? @first_num : results[-1][0].max
    lcm = @first_num * @second_num / gcd

    [results, gcd, lcm]
  end

  def euclid_enumerator(first, second)
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

  def validate_input
    unless valid(params[:input1]) && valid(params[:input2])
      redirect_to root_path, alert: 'You should enter a natural number in each field'
    end
  end

  def valid(input)
    return false if input.to_i.zero?

    /\A\d+\Z/.match?(input)
  end
end
