emailModalController = ($scope, $modalInstance, emailService) ->
  $scope.title = "Email"

  # Sort request object
  $scope.request =
    name: "John Doe"
    email: ""
    message: "This is a test message."

  # Sort service accessor object with success/failure callbacks
  email =
    post: () ->
      emailService.post($scope.request, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
    error: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)

  # Method to start the web-service GET process
  $scope.submit = () ->
    email.post()

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()

  # Clears entered data in the modal
  $scope.clear = () ->
    $scope.request =
      name: ""
    delete $scope.response
    delete $scope.responseString
