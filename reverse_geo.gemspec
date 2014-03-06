Gem::Specification.new do |s|
  s.name = 'ReverseGeo'
  s.version = '0.1.6'
  s.date = '2014-03-06'
  s.summary = 'A gem for reverse geocoding lat/lng pairs into a 3 letter ISO country code'
  s.files = [
    'lib/reverse_geo.rb',
    'lib/reverse_geo/reverse_geo.rb',
    'lib/reverse_geo/countries.geojson'
  ]
  s.require_paths = ['lib']
  s.authors = ['Luka Mirosevic']
  s.add_runtime_dependency 'rgeo', '~> 0.3'
  s.add_runtime_dependency 'rgeo-geojson', '~> 0.2'
end