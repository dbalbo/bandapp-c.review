class AddVenueIdToVenues < ActiveRecord::Migration
  def change
    add_column(:venues, :venue_id, :integer)
  end
end
