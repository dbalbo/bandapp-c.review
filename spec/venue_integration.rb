require('spec_helper')

describe('the add venue path', {:type => :feature}) do
  it('adds a venue') do
    visit('/venues')
    fill_in('name', :with => 'The Moda Center')
    click_button('Add Venue')
    expect(page).to have_content('The Moda Center')
  end
end
