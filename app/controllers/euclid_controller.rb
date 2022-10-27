class EuclidController < ApplicationController
  def index
    @first_num = params[:input_1]
    @second_num = params[:input_2]
  end

  def result
  end
end
