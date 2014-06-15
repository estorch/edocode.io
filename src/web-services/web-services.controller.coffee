examples = angular.module("web-services", [ "check" ])

examples.controller("webServicesController", ($scope, $modal, checkService) ->
  $scope.title = "Web-Services Page"

  checkService.get(
    (status) ->
      if status == 200
        $scope.servicesOnline = true
      else
        $scope.servicesOnline = false
  )

  $scope.open = () ->
    modalInstance = $modal.open(
      {
        templateUrl: "web-services/modals/helloworld.html"
        controller: helloWorldModalController
      }
    )

    modalInstance.result.then(
      () ->
        alert "modal closed"
    )
)
