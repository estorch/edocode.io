app = angular.module('app', [
  'aboutController'
])

app.controller('appController', ['$scope', ($scope) ->
  $scope.title = "Hi Katie"
])