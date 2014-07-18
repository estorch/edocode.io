email = angular.module("email", [ ])

email.service("emailService", ($http, apiPrefix) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  post: (request, success, error) ->
    http =
      method: "POST"
      url: apiPrefix + "/email"
      data: request

    $http(http)
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      ).error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
)