require 'spec_helper'

describe Talk do
  it 'can be created with attributes' do
    talk = Talk.new(title: 'How to talk')
    talk.title.must_equal 'How to talk'
  end
end
