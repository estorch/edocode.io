confirmClearModalController = ($scope, $modalInstance) ->
  $scope.title = 'Confirm Message Clear'

  $scope.confirm = () ->
    $modalInstance.close();

  $scope.dismiss = () ->
    $modalInstance.dismiss();