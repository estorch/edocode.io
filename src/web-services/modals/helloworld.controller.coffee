helloWorldModalController = ($scope, $modalInstance, helloWorldService) ->
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

  # Clear the request object
  clearRequest = () ->
    $scope.request =
      name: ""

  # Clear the response object
  clearResponse = () ->
    $scope.response = null
    $scope.responseString = ""

  # Self-explanitory scope variables
  $scope.pageTitle = "Hello World"
  $scope.request =
    name: ""
  $scope.response = null
  $scope.responseString = ""

  # Method to start the web-service GET process
  $scope.submit = () ->
    helloWorld.get()

  # Clears entered data in the modal
  $scope.clear = () ->
    clearRequest()
    clearResponse()

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()
