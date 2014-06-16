# ReverseGeo ![Version](https://img.shields.io/gem/v/ReverseGeo.svg?style=flat)&nbsp;![License](https://img.shields.io/badge/license-Apache_2-green.svg?style=flat)

A gem for reverse geocoding lat/lng pairs into a 3 letter ISO country code, fully in-memory with no external service access.

Usage
------------

```ruby
require 'reverse_geo'

geo = ReverseGeo.new # Creates a ReverseGeo object which can be used for reverse geocoding (this loads map data into memory)

geo.country(lat: 48.2206849, lng: 16.3800599) # => 'AUT'
```

Copyright & License
------------

Copyright 2014 Goonbee

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
