# frozen_string_literal: true

# main controller
class EuclidController < ApplicationController
  before_action :validate_input, only: :result

  # def index; end

  def result
    data = get_result

    respond_to do |format|
      format.xml { render xml: data.to_xml }
    end
  end

  private

  def get_result
    return { error_msg: 'You should enter a natural number in both inputs' } unless @input_valid

    @first_num = params[:input1].to_i
    @second_num = params[:input2].to_i

    @results, @gcd, @lcm = euclid_algorithm

    {
      first: @first_num,
      second: @second_num,
      steps: @results.map do |res, index|
        {
          index: index,
          first: res[0],
          second: res[1]
        }
      end
    }
  end

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
    @input_valid = true
    unless valid(params[:input1]) && valid(params[:input2])
      @input_valid = false
    end
  end

  def valid(input)
    return false if input.to_i.zero?

    /\A\d+\Z/.match?(input)
  end
end
