contact = angular.module("contact", [ ])

contact.controller("contactController", ($scope, $modal, emailService) ->
  $scope.title = "Contact Page"

  # Email request object
  $scope.email =
    name: ""
    email: ""
    message: ""

  # Email service accessor object with success/failure callbacks
  email =
    post: () ->
      emailService.post($scope.email, this.success, this.error)
    success: () ->
      1
    error: () ->
      1

  # Starts email submission process
  $scope.submit = () ->
    email.post()

  # Modal for clear message confirmation
  $scope.clearMessage = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "contact/modals/confirm.html"
        controller: confirmClearModalController
        size: "sm"
      }
    )

    modalInstance.result.then(
      () ->
        $scope.email =
          name: ""
          email: ""
          message: ""
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