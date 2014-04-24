about = angular.module('about', [ ])

about.controller('aboutController', ($scope) ->
  $scope.about = "About controller data"
)