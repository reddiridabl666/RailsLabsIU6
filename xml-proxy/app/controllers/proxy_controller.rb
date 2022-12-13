# frozen_string_literal: true

require 'open-uri'

# Controller receiving xml from api and converting it to html
class ProxyController < ApplicationController
  before_action :parse_params, only: :output

  def input; end

  def output
    # rubocop:disable Security/Open
    xml_response = URI.open(url)
    # rubocop:enable Security/Open

    case @side
    when 'client'
      render xml: add_xslt_ref(xml_response).to_xml
    when 'server'
      @result = xslt_transform(xml_response).to_html
    else
      render xml: xml_response
    end
  end

  private

  def parse_params
    @first = params[:input1]
    @second = params[:input2]
    @side = params[:side]
  end

  def url
    "http://127.0.0.1:3000/?input1=#{@first}&input2=#{@second}"
  end

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/transform.xslt"))
    xslt.transform(doc)
  end

  def add_xslt_ref(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet',
                                                    'type="text/xsl" href="/browser.xslt"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
