check = angular.module("check", [ ])

check.service("checkService", ["$http", ($http) ->
  get: (success, error) ->
    http =
      method: "GET"
      url: "http://50.132.25.179:8080/check"

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