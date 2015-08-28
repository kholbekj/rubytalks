require 'spec_helper'
require_relative '../../../../apps/web/views/talks/new'

describe Web::Views::Talks::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/talks/new.html.erb') }
  let(:view)      { Web::Views::Talks::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
