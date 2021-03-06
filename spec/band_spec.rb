require('spec_helper')

describe(Band) do
  it('validates presence of name') do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end
end

describe(Band) do
  it { should have_and_belong_to_many(:venues)}
end

describe(Band) do
    it('makes the name entered to have a capital letter')do
    band = Band.create({:name => 'blind melon'})
    expect(band.name()).to(eq('Blind Melon'))
  end
end
