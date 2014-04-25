examples = angular.module('examples', [ ])

examples.controller('examplesController', ($scope) ->
  $scope.title = "Examples Page"
)