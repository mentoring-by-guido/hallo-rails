require "rbflagr"

class InvoicesController < ApplicationController
  def calculate
    config = Flagr::Configuration.new
    config.host = "localhost:18000"
    api_client = Flagr::ApiClient config
    api_instance = Flagr::EvaluationApi api_client
    params = { :entityID => parmas[:member_id], :entityType => "report", :entityContext => { :location => "Sydney" }, :enableDebug => true, :flagID => 2 }
    out = api_instance.post_evaluation params
    puts "==>"
    puts out
    puts "==>"

    render :json => { :result => 42 }

    respond_to :html, :json
  end
end
