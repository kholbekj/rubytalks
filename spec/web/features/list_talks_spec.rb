require 'features_helper'

describe 'List talks' do
  before do
    TalkRepository.clear

    TalkRepository.create(Talk.new(title: 'wat', author: 'watson'))
    TalkRepository.create(Talk.new(title: 'wut', author: 'wutsson'))
  end

  it 'displays each talk on the page' do
    visit '/talks'
    within '#talks' do
      assert page.has_css?('.talk', count: 2), 'Expected to find 2 talks'
    end
  end
end
