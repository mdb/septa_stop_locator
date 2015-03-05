# SeptaStopLocator

Get the SEPTA stops closest to a lat/long point for a given bus/trolley route.

SeptaStopLocator leverages the SEPTA stops API.

## Usage

``` ruby
require 'septa_stop_locator'

SeptaStopLocator.find(39.9539910, -75.1682170, 34)

=> [{"lng"=>-75.165345,
  "lat"=>39.952672,
  "stopid"=>20659,
  "stopname"=>"15th St Trolley Station",
  "distance"=>935.6262555741262},
 {"lng"=>-75.165369,
  "lat"=>39.952502,
  "stopid"=>31140,
  "stopname"=>"15th St Trolley Station",
  "distance"=>963.389584130993}]
```

## About the stops returned

One stop is typically an inbound stop, while the other is typically an outbound stop.

The stops returned can be used to query the SEPTA Bus/trolley schedules API:

```
http://www3.septa.org/hackathon/BusSchedules/?req1=<STOP ID>&req2=<ROUTE ID>
```
