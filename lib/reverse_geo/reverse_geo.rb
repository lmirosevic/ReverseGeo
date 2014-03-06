require 'rgeo'
require 'rgeo/geo_json'

class ReverseGeo
  def initialize(file = 'lib/reverse_geo/countries.geojson')
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
