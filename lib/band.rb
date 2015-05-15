class Band < ActiveRecord::Base

  has_and_belongs_to_many(:venues)

  validates(:name, {:presence => true})
end
