require('bundler/setup')
Bundler.require(:default, :production)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @bands = Band.all()
  erb(:index)
end

post('/band') do
  name = params.fetch('name')
  Band.create({:name => name})
  @bands = Band.all()
  erb(:index)
end

get('/bands/:id') do
  @bands = Band.find(params.fetch('id'))
  erb(:bands)
end

patch('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  name = params.fetch('name')
  @band.update(:name => name)
  erb(:bands)
end

delete('/bands/:id') do
  @band = Band.find(params.fetch('id'))
  @band.delete()
  @bands = Band.all()
  erb(:index)
end
