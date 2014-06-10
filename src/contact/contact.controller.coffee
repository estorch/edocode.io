contact = angular.module('contact', [ ])

contact.controller('contactController', ($scope) ->
  $scope.title = "Contact Page"

  $scope.foo = () ->
    "mailto:" + $scope.bar().split('').reverse().join('')

  $scope.bar = () ->
    ("eric" + "@" + "edocode.io").split('').reverse().join('')

)