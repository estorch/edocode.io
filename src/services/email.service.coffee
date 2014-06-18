email = angular.module("emailService", [ ])

email.service("emailService", ["$http", ($http) ->
  post: (data, success, error) ->
    request =
      From : "eric@edocode.io"
      To : "eric@edocode.io"
      Cc : ""
      Bcc: ""
      Subject : "Edocode.io Contact Form Submission from " + data.name
      Tag : "Contact"
      HtmlBody : "<b>Hello</b>"
      TextBody : data.message
      ReplyTo : data.email
      Headers : []
      TrackOpens : true

    http =
      method: "POST"
      url: "http://api.postmarkapp.com/email"
      data: request
      headers:
        "Accept": "application/json"
        "Content-Type": "application/json"
        "X-Postmark-Server-Token": "POSTMARK_API_TEST"
#        "X-Postmark-Server-Token": "d443dd6f-31f1-41ce-97d0-fd6a113db1ad"

    $http(http)
      .success(
        (data, status, headers, config) ->
          success(data, status, headers, config)
      ).error(
        (data, status, headers, config) ->
          error(data, status, headers, config)
      )
])