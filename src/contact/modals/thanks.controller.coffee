thanksModalController = ($scope, $modalInstance) ->
  $scope.title = 'Thanks'

  # Confirm modal
  $scope.confirm = () ->
    $modalInstance.close();

  # Cancel modal
  $scope.dismiss = () ->
    $modalInstance.dismiss();