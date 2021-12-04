require 'httparty'
class ReportController < ApplicationController
  def show
    res = HTTParty.get("https://oil-api.kovalev.team/api/issue/#{params[:issue_id]}")
    @issue = res.parsed_response
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @issue['issueTitle'],
              formats: :html, encoding: 'utf8'   # Excluding ".pdf" extension.
      end
    end
  end
end
