sortModalController = ($scope, $modalInstance, sortService) ->
  $scope.title = "Sort"

  # Sort request object
  $scope.request =
    nums: "7,4,2,3,9,10,5,8,6,1"
    sort: "bubble"

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

  # Method to start the web-service GET process
  $scope.submit = () ->
    sort.get();

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss();

  # Clears entered data in the modal
  $scope.clear = () ->
    $scope.request =
      name: ""
    delete $scope.response
    delete $scope.responseString
