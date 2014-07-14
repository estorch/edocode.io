check = angular.module("visitors", [ ])

check.service("visitorsService", ["$http", ($http) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  get: (request, success, error) ->
    http =
      method: "GET"
      url: "http://50.132.25.179:8080/visitors/" + request.id

    $http(http)
    .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      )
    .error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )

  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  getAll: (request, success, error) ->
    http =
      method: "GET"
      url: "http://50.132.25.179:8080/visitors"

    $http(http)
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      )
      .error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )

  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  post: (request, success, error) ->
    http =
      method: "POST"
      url: "http://50.132.25.179:8080/visitors"
      data: request
      dataType: 'json'

    $http(http)
    .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      )
    .error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
])