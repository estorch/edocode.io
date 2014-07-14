check = angular.module("visitors", [ ])

check.service("visitorsService", ["$http", ($http) ->
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
  post: (request, success, error) ->
    http =
      method: "POST"
      url: "http://50.132.25.179:8080/visitors"
      data: request
      dataType: 'json'

    console.log request
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