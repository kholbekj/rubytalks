require 'spec_helper'
require_relative '../../../../apps/web/controllers/talks/new'

describe Web::Controllers::Talks::New do
  let(:action) { Web::Controllers::Talks::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
