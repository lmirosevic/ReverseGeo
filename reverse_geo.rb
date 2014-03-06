require 'rgeo'
require 'rgeo/geo_json'

class ReverseGeo
  def initialize(file)
    raise ArgumentError, 'Did not supply a valid geojson file.' unless File.exist?(file)

    @factory = RGeo::Geos.factory(srid: 4326)
    @countries = RGeo::GeoJSON.decode(File.open(file).read, :json_parser => :json, :geo_factory => @factory)
  end

  def country(opts = {})
    raise ArgumentError, 'Did not supply a valid lat ([0,90]) and lng ([-180,180])' unless opts[:lat] && opts[:lat].between?(0, 90) && opts[:lng] && opts[:lng].between?(-180, 180)

    poi = @factory.point(opts[:lng], opts[:lat])
    @countries.each do |country|
      return country.properties['iso_a3'] if poi.within?(country.geometry)
    end

    return nil#fallback if we didn't find anything
  end
end


geo = ReverseGeo.new('./countries.geojson')
puts geo.country(lat: 1.3185848, lng: 103.8455665)



# require "benchmark" 
# Benchmark.bm(3) do |x|
#   x.report("SGP:") do
#     puts geo.country(lat: 1.3185848, lng: 103.8455665)
#   end

#   x.report("AUT:") do
#     puts geo.country(lat: 48.2206849, lng: 16.3800599)
#   end
# end


# require "benchmark" 
# Benchmark.bm(3) do |x|
#   x.report("normal:") do
#     geo = ReverseGeo.new('./countries.geojson')
#   end

#   x.report("lite:") do
#     geo = ReverseGeo.new('./countries-lite.geojson')
#   end
# end




# geo = ReverseGeo.new('./countries.geojson')#51.2 MB ram

# geo = ReverseGeo.new('./countries-lite.geojson')#62.7 MB ram

# sleep 100