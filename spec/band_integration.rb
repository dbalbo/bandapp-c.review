require('spec_helper')

describe('the add band path', {:type => :feature}) do
 it('adds a band') do
   visit('/bands')
   fill_in('name', :with => 'Blind Melon')
   click_button('Add Band')
   expect(page).to have_content('Blind Melon')
 end
end

describe('the band page', {:type => :feature}) do
 it('goes to a band page') do
   visit('/bands/1')
   expect(page).to have_content('Blind Melon')
 end
end

describe('the update band path', {:type => :feature}) do
 it('updates - changes a band name') do
   visit('/bands/7')
   fill_in('name', :with => 'Styxx')
   click_button('Update')
   expect(page).to have_content('Styxx')
 end
end
