ip = angular.module("ip", [ ])

ip.service("ipService", ($http, apiPrefix) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  post: (request) ->
    data =
      ip: request

    http =
      method: "POST"
      url: apiPrefix + "/ip"
      data: data

    $http(http)
)