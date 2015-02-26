require 'rails_helper'

# .to be_true
# .to be_false
# .to be_visible

describe 'test the people toggle', type: :feature, js: true do
  it 'should hide johns on the main page'  do
    visit root_path
    expect(first(".jdawg")).to be_visible
    find(".jhide").click
    expect(first(".jdawg", visible: false)).not_to be_visible
  end

  it 'should show johns on the main page'  do
    visit root_path
    expect(first(".jdawg")).to be_visible
    find(".jhide").click
    expect(first(".jdawg", visible: false)).not_to be_visible
    find(".jshow").click
    expect(first(".jdawg")).to be_visible
  end
end
