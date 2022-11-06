class EuclidController < ApplicationController
  def index
  end

  def valid(input)
    return false if input.to_i == 0
    /\A\d+\Z/.match?(input)
  end

  def result
    unless valid(params[:input_1]) && valid(params[:input_2])
      return redirect_to "/", alert: "You should enter a natural number in each field"
    end

    @first_num = params[:input_1].to_i
    @second_num = params[:input_2].to_i

    first_res = @first_num
    second_res = @second_num

    iter = 0
    @results = Enumerator.new do |yielder|
      loop do
        if first_res < second_res
          yielder << [iter += 1, first_res, second_res -= first_res]
        else
          yielder << [iter += 1, first_res -= second_res, second_res]
        end
      end
    end.take_while { |_, first, second | [first, second].min != 0 }

    @gcd = [first_res, second_res].max
    @lcm = @first_num * @second_num / @gcd

    respond_to do |format|
      format.js
      # format.html
    end
  end
end
