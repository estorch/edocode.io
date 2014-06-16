helloWorldModalController = ($scope, $modalInstance, helloWorldService) ->
  $scope.title = "Hello World!"

  $scope.request =
    name: ""

  helloWorld =
    get: () ->
      helloWorldService.get($scope.request, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
    error: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)

  $scope.submit = () ->
    helloWorld.get();

  $scope.dismiss = () ->
    $modalInstance.dismiss();

  $scope.clear = () ->
    $scope.request =
      name: ""
    delete $scope.response
    delete $scope.responseString
