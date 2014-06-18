examples = angular.module("web-services", [ ])

examples.controller("webServicesController", ($scope, $modal, checkService, scottismsService) ->
  $scope.title = "Web-Services Page"
  $scope.status = "unknown"

  check =
    get: () ->
      checkService.get(this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.status = status
    error: (data, status, headers, config) ->
      $scope.status = status

  scottisms =
    get: () ->
      scottismsService.get(this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.scottisms = data.content
    error: (data, status, headers, config) ->
#      $scope.status = status

  $scope.openHelloWorld = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/helloworld.html"
        controller: helloWorldModalController
      }
    )

  $scope.openScottisms = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/scottisms.html"
        controller: scottismsModalController
      }
    )

  check.get()
)
