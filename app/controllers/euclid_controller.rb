# frozen_string_literal: true

# main controller
class EuclidController < ApplicationController
  before_action :validate_input, only: :result

  def index; end

  def get_xml_db
    respond_to do |format|
      format.xml { render xml: EuclidResult.all.map(&:to_xml) }
    end
  end

  def result
    @first_num = params[:input_1].to_i
    @second_num = params[:input_2].to_i

    # @steps, @gcd, @lcm = EuclidResult.get(@first_num, @second_num)
    @steps, @gcd, @lcm = ActiveSupport::JSON.decode(EuclidResult.get_json(@first_num, @second_num)).values
  end

  private

  def validate_input
    unless valid(params[:input_1]) && valid(params[:input_2])
      redirect_to root_path, alert: "You should enter a natural number in each field"
    end
  end

  def valid(input)
    return false if input.to_i == 0
    /\A\d+\Z/.match?(input)
  end
end
