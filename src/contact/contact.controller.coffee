contact = angular.module('contact', [ 'emailService' ])

contact.controller('contactController', ($scope, emailService) ->
  $scope.title = "Contact Page"

  $scope.foo = () ->
    "mailto:" + $scope.bar().split('').reverse().join('')

  $scope.bar = () ->
    "oi.edocode" + baz() + "cire"

  baz = () ->
    "@"

  emailService.get()
)