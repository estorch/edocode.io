resume = angular.module('resume', [ ])

resume.controller('resumeController', ($scope) ->
  $scope.about = "Resume controller data"
)