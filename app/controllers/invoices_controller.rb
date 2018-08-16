require "featureflow"

class InvoicesController < ApplicationController
  def calculate
    context = {
      key: params[:member_id],
      values: {
        location: location,
        group: group,
        average: params[:member_id].to_i
      },
      attributes: {
        location: location,
        group: group,
        average: params[:member_id].to_i
      }
    }

    puts "==>"
    puts context
    toggle_5 = featureflow.evaluate("feature-5", context)
    toggle_6 = featureflow.evaluate("feature-6", context)
    toggle_7 = featureflow.evaluate("feature-7", context)
    puts "==>"

    render :json => {
      member: params[:member_id],
      payload: context,
      toggle_5: toggle_5.value,
      toggle_6: toggle_6.value,
      toggle_7: toggle_7.value
    }

    respond_to :html, :json
  end

  private

  def location
    return "Melbourne" if params[:member_id].to_i % 2 == 0
    return "Sydney" if params[:member_id].to_i % 3 == 0

    "Brisbane"
  end

  def group
    return "Flatmates.com.au" if params[:member_id].to_i % 2 == 0

    "The Money"
  end
end
