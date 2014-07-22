about = angular.module("about", [ ])

about.controller("aboutController", ($scope) ->
  $scope.pageTitle = "Eric R. Storch"
  $scope.pageSubtitle = "Software Developer"
  $scope.photo = "me.jpg"

  $scope.changeImg = () ->
    if ($scope.photo is "me.jpg")
      $scope.photo = "me_and_katie.jpg"
    else
      $scope.photo = "me.jpg"

)
