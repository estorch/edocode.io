email = angular.module("emailService", [ ])

email.service("emailService", ["$http", ($http) ->
  # Service accessor object: bulds HTTP object and calls $http with it and the passed callbacks
  post: (data, success, error) ->
#    request =
#      From : "eric@edocode.io"
#      To : "eric@edocode.io"
#      Cc : ""
#      Bcc: ""
#      Subject : "Edocode.io Contact Form Submission from " + data.name
#      Tag : "Contact"
#      HtmlBody : "<b>Hello</b>"
#      TextBody : data.message
#      ReplyTo : data.email
#      Headers : []
#      TrackOpens : true

    http =
      method: "POST"
      url: "http://50.132.25.179:8080/email"
      data: data
      dataType: 'json'

    $http(http)
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      ).error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
])