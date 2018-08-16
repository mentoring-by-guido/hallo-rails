require "ldclient-rb"

class InvoicesController < ApplicationController
  def calculate
    member    = Member.find_by(external_id: params[:member_id])
    ld_client = LaunchDarkly::LDClient.new("sdk-b5ab387b-85e0-43ae-8348-8d64b8c3e25c")
    be_ff1    = Rails.application.config.ld_client.variation("back-end-feature-flag-1", member_hash, false)
    be_ff2    = Rails.application.config.ld_client.variation("back-end-feature-flag-2", member_hash, false)

    render :json => {
      back_end_feature_flag_1: be_ff1,
      back_end_feature_flag_2: be_ff2,
      mamber: member_hash
    }

    respond_to :html, :json
  end

  private

  def member_hash
    return member_hash_v1 if params[:member_id].to_i < 500
    return member_hash_v2 if params[:member_id].to_i >= 500
  end

  def member_hash_v1
    {
      key: params[:member_id],
      custom: {
        groups: ["AlertsV1"]
      }
    }
  end

  def member_hash_v2
    {
      key: params[:member_id],
      custom: {
        groups: ["AlertsV2"]
      }
    }
  end
end
