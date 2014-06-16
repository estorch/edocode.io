check = angular.module("check", [ ])

check.service("checkService", ["$http", ($http) ->
  get: (success, error) ->
    $http.get("http://50.132.25.179:8080/check")
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      )
      .error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
])