app = angular.module('app', [
  'ngRoute'
  'about'
  'contact'
  'examples'
  'resume'
  'linkedin'
  'github'
])

app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/about', {
      templateUrl: 'about/about.html'
      controller: 'aboutController'
    }).when('/examples', {
      templateUrl: 'examples/examples.html'
      controller: 'examplesController'
    }).when('/resume', {
      templateUrl: 'resume/resume.html'
      controller: 'resumeController'
    }).when('/linkedin', {
      templateUrl: 'linkedin/linkedin.html'
      controller: 'linkedinController'
    }).when('/github', {
      templateUrl: 'github/github.html'
      controller: 'githubController'
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