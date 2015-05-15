require('bundler/setup')
Bundler.require(:default, :production)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
