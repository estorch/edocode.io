examples = angular.module('web-services', [ 'checkService' ])

examples.controller('web-servicesController', ($scope, checkService) ->
  $scope.title = "Web-Services Page"

  checkService.get(
    (status) ->
      if status == 200
        $scope.servicesOnline = true
      else
        $scope.servicesOnline = false
  )
)