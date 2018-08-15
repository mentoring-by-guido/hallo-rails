class InvoicesController < ApplicationController
  def calculate
    render :json => { :result => 42 }

    respond_to :html, :json
  end
end
