check = angular.module('checkService', [ ])

check.service('checkService', ['$http', ($http) ->
  success = (data, status, headers, config) ->
    data
  error = (data, status, headers, config) ->
    status

  get: (callback) ->
    $http.get("http://50.132.25.179:8080/greeting")
      .success(
        (data, status, headers, config) ->
          callback(status)
      )
      .error(
        (data, status, headers, config) ->
          callback(status)
      )
])