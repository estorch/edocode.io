app = angular.module('app', [
  'ngRoute'
  'ngResource'
  'ui.bootstrap'
  'about'
  'contact'
  'web-services'
  'resume'
  'emailService'
  'checkService'
])

app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/about', {
      templateUrl: 'about/about.html'
      controller: 'aboutController'
    }).when('/web-services', {
      templateUrl: 'web-services/web-services.html'
      controller: 'web-servicesController'
    }).when('/resume', {
      templateUrl: 'resume/resume.html'
      controller: 'resumeController'
    }).when('/contact', {
      templateUrl: 'contact/contact.html'
      controller: 'contactController'
    }).otherwise({
      redirectTo: '/about'
    })
])

app.controller('appController', ['$scope', ($scope) ->
  $scope.title = "Hi Katie"
  $scope.app = "Stuff"
])