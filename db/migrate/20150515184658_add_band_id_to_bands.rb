class AddBandIdToBands < ActiveRecord::Migration
  def change

    add_column(:bands, :band_id, :integer)
  end
end
