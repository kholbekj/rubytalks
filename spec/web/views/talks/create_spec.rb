require 'spec_helper'
require_relative '../../../../apps/web/views/talks/create'

describe Web::Views::Talks::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/talks/create.html.erb') }
  let(:view)      { Web::Views::Talks::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
