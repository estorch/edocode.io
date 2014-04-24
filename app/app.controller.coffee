app = angular.module('app', [
  'about'
  'contact'
  'examples'
  'resume'
])

app.controller('appController', ['$scope', ($scope) ->
  $scope.title = "Hi Katie"
  $scope.app = "Stuff"
])