require 'features_helper'

describe 'Talks' do
  after do
    TalkRepository.clear
  end

  it 'can create a new talk' do
    visit '/talks/new'

    within 'form#talk-form' do
      fill_in 'Title', with: 'How to script'
      fill_in 'Author', with: 'William Shakespear'
      fill_in 'Link', with: 'www.google.com'

      click_button 'Create'
    end

    current_path.must_equal '/talks'
    assert page.has_content?('How to script')
  end
end
