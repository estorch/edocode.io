contact = angular.module("contact", [ ])

contact.controller("contactController", ($scope, $modal, emailService) ->
  # Email service accessor object with success/failure callbacks
  email =
    post: () ->
      emailService.post(request, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.status = "Success: " + status
      $scope.sendButtonText = "Sent"
    error: (data, status, headers, config) ->
      $scope.status = "Error: " + status
      $scope.sendButtonLock = false
      $scope.sendButtonText = "Try Again"

  request =
    name: ""
    email: ""
    message: ""

  # Self-explanitory variables
  $scope.pageTitle = "Contact"
  $scope.pageSubtitle = "Let's Get In Touch!"
  $scope.sendButtonText = "Send"
  $scope.sendButtonLock = false

  # Email form object
  $scope.email =
    name: ""
    email: ""
    message: ""

  # Starts email submission process
  $scope.submit = () ->
    # Email request object
    request =
      email: $scope.bar().split("").reverse().join("")
      subject: "Message Submission From EdoCode.io"
      message: "Name:<br>" + $scope.email.name + "<br><br>Email:<br>" + $scope.email.email + "<br><br>Message:<br>" + $scope.email.message

    $scope.sendButtonLock = true
    $scope.sendButtonText = "Sending"
    email.post()

  # Modal for clear message confirmation
  $scope.clearMessage = () ->
    # Open clear confirmation modal
    modalInstance = $modal.open(
      {
        templateUrl: "contact/modals/clear.html"
        controller: clearModalController
        size: "sm"
      }
    )

    # Do once modal closes
    modalInstance.result.then(
      () ->
        $scope.email =
          name: ""
          email: ""
          message: ""
        $scope.contactForm.$setPristine()
        $scope.sendButtonText = "Send"
        $scope.sendButtonLock = false
        $scope.status = ""
    )

  # Obsfucation paranoia
  $scope.foo = () ->
    "mailto:" + $scope.bar().split("").reverse().join("")

  # Obsfucation paranoia 2
  $scope.bar = () ->
    "oi.edocode" + baz() + "cire"

  # Obsfucation paranoia 3
  baz = () ->
    "@"
)
