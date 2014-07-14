helloWorldModalController = ($scope, $modalInstance, helloWorldService) ->
  $scope.title = "Hello World"

  # HelloWorld request object
  $scope.request =
    name: ""

  # HelloWorld service accessor object with success/failure callbacks
  helloWorld =
    get: () ->
      helloWorldService.get($scope.request, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
    error: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)

  # Method to start the web-service GET process
  $scope.submit = () ->
    helloWorld.get();

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss();

  # Clears entered data in the modal
  $scope.clear = () ->
    $scope.request =
      name: ""
    delete $scope.response
    delete $scope.responseString
