sortModalController = ($scope, $modalInstance, sortService) ->
  # Sort service accessor object with success/failure callbacks
  sort =
    get: () ->
      sortService.get($scope.request, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
    error: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)

  # Clear the request object
  clearRequest = () ->
    $scope.request =
      nums: "7,4,2,3,9,10,5,8,6,1"
      sort: "bubble"

  # Clear the response object
  clearResponse = () ->
    $scope.response = null
    $scope.responseString = ""

  # Self-explanitory scope variables
  $scope.pageTitle = "Sort"
  $scope.request =
    nums: "7,4,2,3,9,10,5,8,6,1"
    sort: "bubble"

  # Method to start the web-service GET process
  $scope.submit = () ->
    sort.get()

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()

  # Clears entered data in the modal
  $scope.clear = () ->
    this.sortForm.$setPristine()
    clearRequest()
    clearResponse()