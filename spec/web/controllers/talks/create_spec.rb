require 'spec_helper'
require_relative '../../../../apps/web/controllers/talks/create'

describe Web::Controllers::Talks::Create do
  let(:action) { Web::Controllers::Talks::Create.new }
  after do
    TalkRepository.clear
  end
  before do
    TalkRepository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[talk: { title: 'How to type', author: 'John Wayne', link: 'www.google.com' }] }

    it 'creates a new talk' do
      action.call(params)
      TalkRepository.all.count.must_equal 1
    end

    it 'redirects the user to the talks listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/talks'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[talk: { title: 'I have no author' }] }

    it 're-renders the talks#new view' do
      response = action.call(params)
      response[0].must_equal 200
    end
  end
end
