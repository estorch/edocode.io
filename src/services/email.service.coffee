email = angular.module("emailService", [ ])

email.service("emailService", ["$http", ($http) ->
  submit: () ->
    "get ws"
  get: () ->
    $http.get("http://rest-service.guides.spring.io/greeting")
      .success( (data) -> data )
])