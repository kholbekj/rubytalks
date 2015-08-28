require 'spec_helper'
require_relative '../../../../apps/web/views/talks/new'

NewTalkParams = Web::Controllers::Talks::Create::Params

describe Web::Views::Talks::New do
  let(:params)    { NewTalkParams.new({}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/talks/new.html.erb') }
  let(:view)      { Web::Views::Talks::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "displays list of errors when params contains errors" do
    params.valid?

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('title is required')
  end
end
