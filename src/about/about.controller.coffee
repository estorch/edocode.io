about = angular.module("about", [ ])

about.controller("aboutController", ($scope) ->
  $scope.pageTitle = "Eric R. Storch"
  $scope.pageSubtitle = "Software Developer"

  # As you can see, a lot of exciting stuff happens here.
) 