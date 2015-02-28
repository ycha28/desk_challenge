headerController = angular.module('headerController', [])

headerController.controller('HeaderController', [ '$scope', '$location', 
  ($scope, $location) ->
    $scope.isActive = (viewLocation) ->
      viewLocation == $location.path()
])