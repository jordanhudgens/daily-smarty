require 'rails_helper'

describe 'Static Pages' do
  it 'has a homepage with a specific title' do
    visit root_path
    expect(page.title).to eq('DailySmarty | A Tool for Learning Something New Everyday')
  end
end
