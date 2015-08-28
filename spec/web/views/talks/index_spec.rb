require 'spec_helper'
require_relative '../../../../apps/web/views/talks/index'

describe Web::Views::Talks::Index do
  let(:exposures) { Hash[talks: []] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/talks/index.html.erb') }
  let(:view)      { Web::Views::Talks::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #talks" do
    view.talks.must_equal exposures.fetch(:talks)
  end
  describe 'when there are no talks' do
    it 'shows a placeholder message' do
      rendered.must_include '<p class="placeholder">No talks yet :(</p>'
    end
  end

  describe 'when there are talks' do
    let(:talk1) { Talk.new(title: 'How to code', author: 'Donald Trump') }
    let(:talk2) { Talk.new(title: 'How not to code', author: 'Bill Gates') }
    let(:exposures) { Hash[talks: [talk1, talk2]] }

    it 'lists them all' do
      rendered.scan(/class="talk"/).count.must_equal 2
      rendered.must_include 'How to code'
      rendered.must_include 'How not to code'
    end

    it 'hides the placeholder message' do
      view.render.wont_include '<p class="placeholder">No talks yet :(</p>'
    end
  end
end
