about = angular.module('app', {})

about.controller('aboutController', ($scope) ->
  $scope.about = "About controller data"
)