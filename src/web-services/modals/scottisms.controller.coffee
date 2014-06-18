scottismsModalController = ($scope, $modalInstance, scottismsService) ->
  $scope.title = "Things Scott Says"

  scottisms =
    get: () ->
      scottismsService.get(this.success, this.error);
    success: (data, status, headers, config) ->
      $scope.response = data
      console.log $scope.response
    error: (data, status, headers, config) ->
      $scope.response = data

  $scope.submit = () ->
    scottisms.get();

  $scope.dismiss = () ->
    $modalInstance.dismiss();

  $scope.clear = () ->
    delete $scope.response
    delete $scope.responseString
