Gem::Specification.new do |s|
  s.name = 'ReverseGeo'
  s.version = '0.2.3'
  s.date = '2014-07-24'
  s.summary = 'A gem for reverse geocoding lat/lng pairs into a 3 letter ISO country code, fully in-memory with no external service access.'
  s.files = [
    'lib/reverse_geo.rb',
    'lib/reverse_geo/reverse_geo.rb',
    'lib/reverse_geo/World-EEZ.geojson'
  ]
  s.require_paths = ['lib']
  s.licenses = ['Apache License 2.0']
  s.authors = ['Luka Mirosevic']
  s.homepage = 'https://github.com/lmirosevic/ReverseGeo'
  s.add_runtime_dependency 'rgeo', '~> 0.3'
  s.add_runtime_dependency 'rgeo-geojson', '~> 0.2'
end
