class EuclidController < ApplicationController
  def index
  end

  def result
    @first_num = params[:input_1].to_i
    @second_num = params[:input_2].to_i
  end
end
