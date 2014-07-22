resume = angular.module("resume", [ ])

resume.controller("resumeController", ($scope) ->
  $scope.pageTitle = "Résumé"
  $scope.pageSubtitle = "July 20th, 2014"

  # A lot of exciting stuff happening on this static page!
)