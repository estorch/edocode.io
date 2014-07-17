email = angular.module("email", [ ])

email.service("emailService", ["$http", ($http) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  post: (data, success, error) ->
    http =
      method: "POST"
      url: "http://50.132.25.179:8080/email"
      data: data

    $http(http)
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      ).error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
])