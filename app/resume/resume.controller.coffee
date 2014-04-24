about = angular.module('aboutController', {})

about.controller('aboutController', ($scope) ->
  $scope.about = "About controller data"
)