clearModalController = ($scope, $modalInstance) ->
  $scope.title = 'Confirm Message Clear'

  # Confirm modal
  $scope.confirm = () ->
    $modalInstance.close()

  # Cancel modal
  $scope.dismiss = () ->
    $modalInstance.dismiss()