check = angular.module("helloWorld", [ ])

check.service("helloWorldService", ["$http", ($http) ->
  get: (request, success, error) ->
    http =
      method: "GET"
      url: "http://50.132.25.179:8080/greeting"
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