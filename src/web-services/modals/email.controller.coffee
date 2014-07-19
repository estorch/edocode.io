emailModalController = ($scope, $modalInstance, emailService) ->
  $scope.pageTitle = "Email"

  # Sort request object
  $scope.request =
    email: ""
    subject: ""
    message: "This is a test message."

  $scope.sendButtonText = "Send (POST)"
  $scope.sendButtonLock = false

  # Sort service accessor object with success/failure callbacks
  email =
    post: () ->
      emailService.post($scope.request, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.status = "Success: " + status
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
      $scope.sendButtonText = "Sent"
    error: (data, status, headers, config) ->
      $scope.status = "Error: " + status
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
      $scope.sendButtonLock = false
      $scope.sendButtonText = "Try Again"

  # Clear the request object
  clearRequest = () ->
    $scope.request =
      email: ""
      subject: ""
      message: "This is a test message."

  # Clear the response object
  clearResponse = () ->
    $scope.response = null
    $scope.responseString = ""

  # Method to start the web-service GET process
  $scope.submit = () ->
    $scope.sendButtonLock = true
    $scope.sendButtonText = "Sending"
    email.post()

  # Clears entered data in the modal
  $scope.clear = () ->
    clearRequest()
    clearResponse()
    this.emailForm.$setPristine()
    $scope.sendButtonText = "Send (POST)"
    $scope.sendButtonLock = false
    $scope.status = ""

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()