visitorsModalController = ($scope, $modalInstance, visitorsService) ->
  $scope.title = "Visitors"

  $scope.getRequest =
    id: 0

  $scope.postRequest =
    name: ""

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


  $scope.submitGet = () ->
    visitors.get();

  $scope.submitGetAll = () ->
    visitors.getAll();

  $scope.submitPost = () ->
    visitors.post();

  $scope.dismiss = () ->
    $modalInstance.dismiss();

  $scope.clear = () ->
    $scope.request =
      name: ""
    delete $scope.response
    delete $scope.responseString
