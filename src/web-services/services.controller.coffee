services = angular.module("services", [ ])

services.controller("servicesController", ($scope, $modal, checkService, scottismsService) ->
  # Check service accessor object with success/failure callbacks
  check =
    get: () ->
      checkService.get(this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.status = status
    error: (data, status, headers, config) ->
      $scope.status = status

  # Scottisms service accessor object with success/failure callbacks
  scottisms =
    get: () ->
      scottismsService.get(this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.scottisms = data.content
      $scope.status = status
    error: (data, status, headers, config) ->
      $scope.status = status

  $scope.pageTitle = "Web-Services"
  $scope.status = "unknown"

  # Opens HelloWorld web-service modal
  $scope.openHelloWorld = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/helloworld.html"
        controller: helloWorldModalController
      }
    )

  # Opens Scottisms web-service modal
  $scope.openScottisms = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/scottisms.html"
        controller: scottismsModalController
      }
    )

  # Opens Visitors web-service modal
  $scope.openVisitors = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/visitors.html"
        controller: visitorsModalController
      }
    )

  # Opens Sort web-service modal
  $scope.openSort = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/sort.html"
        controller: sortModalController
      }
    )

  # Opens Sort web-service modal
  $scope.openEmail = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/email.html"
        controller: emailModalController
      }
    )

  # Run web-service check on page load
  check.get()
)
