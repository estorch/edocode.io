check = angular.module("sort", [ ])

check.service("sortService", ($http, apiPrefix) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  get: (request, success, error) ->
    http =
      method: "GET"
      url: apiPrefix + "/sort"
      params: request

    $http(http)
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      )
      .error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
)