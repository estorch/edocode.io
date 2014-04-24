examples = angular.module('examples', [ ])

examples.controller('examplesController', ($scope) ->
  $scope.about = "About controller data"
)