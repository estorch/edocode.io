contact = angular.module("contact", [ ])

contact.controller("contactController", ($scope, $modal, emailService) ->
  $scope.title = "Contact Page"

  $scope.email =
    name: ""
    email: ""
    message: ""

  email =
    post: () ->
      emailService.post($scope.email, this.success, this.error)
    success: () ->
      1
    error: () ->
      1

  $scope.submit = () ->
    email.post()

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

  # Obsfucation paranoia functions
  $scope.foo = () ->
    "mailto:" + $scope.bar().split("").reverse().join("")

  $scope.bar = () ->
    "oi.edocode" + baz() + "cire"

  baz = () ->
    "@"
)