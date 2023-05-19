require 'httparty'
class ReportController < ApplicationController
  def show
    # res = HTTParty.get("https://oil-api.kovalev.team/api/issue/#{params[:issue_id]}")
    # report = HTTParty.post("https://oil-api.kovalev.team/api/issue/buildReport?issueId=#{params[:issue_id]}")
    # plant = HTTParty.get("https://oil-api.kovalev.team/api/plant/#{res['plantId']}")
    @report = {}#report.parsed_response
    @issue = {}#res.parsed_response
    @plant = {}#plant.parsed_response
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @issue['issueTitle'] || 'order.pdf',
               formats: :html, encoding: 'utf8'   # Excluding ".pdf" extension.
      end
    end
  end
end
