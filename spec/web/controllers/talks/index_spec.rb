require 'spec_helper'
require_relative '../../../../apps/web/controllers/talks/index'

describe Web::Controllers::Talks::Index do
  let(:action) { Web::Controllers::Talks::Index.new }
  let(:params) { Hash[] }

  before do
    TalkRepository.clear

    @talk = TalkRepository.create(Talk.new(title: 'How to pretende to code', author: 'Sarah Palin'))
  end

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all talks' do
    action.call(params)
    action.exposures[:talks].must_equal [@talk]
  end
end
