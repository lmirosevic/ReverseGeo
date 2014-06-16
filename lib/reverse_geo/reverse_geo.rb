require 'rgeo'
require 'rgeo/geo_json'

class ReverseGeo
  @@default_shapefile = 'World-EEZ.geojson'

  def initialize(file = nil)
    file ||= File.join(File.dirname(__FILE__), @@default_shapefile)
    raise ArgumentError, 'Did not supply a valid geojson file.' unless File.exist?(file)

    @factory = RGeo::Geos.factory(srid: 4326)
    @countries = RGeo::GeoJSON.decode(File.open(file).read, :json_parser => :json, :geo_factory => @factory)
  end

  def country(opts = {})
    raise ArgumentError, "Did not supply a valid lat ([-90,90]) and lng ([-180,180]). You supplied lat: #{opts[:lat]}, lng: #{opts[:lng]}" unless opts[:lat] && opts[:lat].between?(-90, 90) && opts[:lng] && opts[:lng].between?(-180, 180)

    poi = @factory.point(opts[:lng], opts[:lat])
    @countries.each do |country|
      return country.properties['ISO_A3'] if poi.within?(country.geometry)
    end

    return nil#fallback if we didn't find anything
  end
end
