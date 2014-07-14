scottismsModalController = ($scope, $modalInstance, scottismsService) ->
  $scope.title = "Things Scott Says"

  # Scottisms service accessor object with success/failure callbacks
  scottisms =
    get: () ->
      scottismsService.get(this.success, this.error);
    success: (data, status, headers, config) ->
      $scope.response = data
      console.log $scope.response
    error: (data, status, headers, config) ->
      $scope.response = data

  # Method to start the web-service GET process
  $scope.submit = () ->
    scottisms.get();

  # Cancels the modal
  $scope.dismiss = () ->
    $modalInstance.dismiss();
