require 'open-uri'

class ProxyController < ApplicationController
  before_action :get_params, only: :output

  def input
  end

  def output
    xml_response = URI.open(url)

    if @side == 'raw'
      render xml: xml_response
    elsif @side == 'server'
      @result = xslt_transform(xml_response).to_html
    else
      render xml: add_xslt_ref(xml_response).to_xml
    end
  end

  private

  def get_params
    @first = params[:input1]
    @second = params[:input2]
    @side = params[:side]
  end

  def url
    "http://127.0.0.1:3000/?input1=#{@first}&input2=#{@second}"
  end

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(xslt_path))
    xslt.transform(doc)
  end

  def xslt_path
    "#{Rails.root}/public/transform.xslt"
  end

  def add_xslt_ref(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc, 'xml-stylesheet', '
                                                    type="text/xsl" href="' + xslt_path + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
