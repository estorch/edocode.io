scottismsModalController = ($scope, $modalInstance, scottismsService) ->
  # Scottisms service accessor object with success/failure callbacks
  scottisms =
    get: () ->
      scottismsService.get(this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
    error: (data, status, headers, config) ->
      $scope.response = data

  # Clear the response object
  clearResponse = () ->
    $scope.response = null

  # Self-explanitory scope variables
  $scope.pageTitle = "Things Scott Says"

  # Method to start the web-service GET process
  $scope.submit = () ->
    scottisms.get()

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()

  # Clears entered data in the modal
  $scope.clear = () ->
    clearResponse()