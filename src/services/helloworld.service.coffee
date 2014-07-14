check = angular.module("helloWorld", [ ])

check.service("helloWorldService", ["$http", ($http) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  get: (request, success, error) ->
    http =
      method: "GET"
      url: "http://50.132.25.179:8080/helloworld"
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
])