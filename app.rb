require('bundler/setup')
Bundler.require(:default, :production)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @bands = Band.all()
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/bands') do
  name = params.fetch('name').titleize()
  Band.create({:name => name})
  @bands = Band.all()
  erb(:bands)
end

post('/venues') do
  name = params.fetch('name')
  Venue.create({:name => name})
  @venues = Venue.all()
  erb(:venues)
end

get('/band/:id') do
  @bands = Band.find(params.fetch('id'))
  @venues = Venue.all()
  @venues_checked = @band.venues.ids
  erb(:band_info)
end

patch('/band/:id') do
  @band = Band.find(params.fetch'id'))
  name = params.fetch('name')
  @band.update(:name => name)
  @venues =Venue.all()
  @venues_checked = @band.venues.ids
  erb(:band_info)
end

delete('/band/:id') do
  @band = Band.find(params.fetch('id'))
  @band.delete()
  @bands = Band.all()
  erb(:bands)
end
  
patch('/venue/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  venue_ids = params.fetch("venue_ids")
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  @venues_checked = @band.venues.ids
  erb(:band)
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id"))
  erb(:venue)
end
