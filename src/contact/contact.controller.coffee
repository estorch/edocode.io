contact = angular.module("contact", [ ])

contact.controller("contactController", ($scope, $modal) ->
  $scope.title = "Contact Page"

  $scope.email =
    name: ""
    email: ""
    message: ""

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