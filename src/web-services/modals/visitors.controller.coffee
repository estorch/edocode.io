visitorsModalController = ($scope, $modalInstance, visitorsService) ->
  $scope.title = "Visitors"

  # Visitors GET request object
  $scope.getRequest =
    id: 0

  # Visitors POST request object
  $scope.postRequest =
    name: ""

  # Visitors service accessor object with success/failure callbacks
  visitors =
    get: () ->
      visitorsService.get($scope.getRequest, this.success, this.error)
    getAll: () ->
      visitorsService.getAll(this.success, this.error)
    post: () ->
      visitorsService.post($scope.postRequest, this.success, this.error)
    success: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)
    error: (data, status, headers, config) ->
      $scope.response = data
      $scope.responseString = JSON.stringify(data)

  # Method to start the web-service GET process
  $scope.submitGet = () ->
    visitors.get();

  # Method to start the web-service GET process
  $scope.submitGetAll = () ->
    visitors.getAll();

  # Method to start the web-service POST process
  $scope.submitPost = () ->
    visitors.post();

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss();

