visitorsModalController = ($scope, $modalInstance, visitorsService) ->
  # Visitors service accessor object with success/failure callbacks
  visitors =
    getId: () ->
      visitorsService.getId($scope.getRequest, this.success, this.error)
    get: () ->
      visitorsService.get(this.success, this.error)
    post: () ->
      visitorsService.post($scope.postRequest, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
    error: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)

  # Clear the request object
  clearRequest = () ->
    $scope.getRequest =
      id: 0
    $scope.postRequest =
      name: ""

  # Clear the response object
  clearResponse = () ->
    $scope.response = null
    $scope.responseString = ""

  # Self-explanitory scope variables
  $scope.pageTitle = "Visitors"
  $scope.getRequest =
    id: 0
  $scope.postRequest =
    name: ""

  # Method to start the web-service GET process
  $scope.submitGet = () ->
    visitors.get()

  # Method to start the web-service GET process
  $scope.submitGetId = () ->
    visitors.getId()

  # Method to start the web-service POST process
  $scope.submitPost = () ->
    visitors.post()

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()

  # Clears entered data in the modal
  $scope.clear = () ->
    clearRequest()
    clearResponse()

