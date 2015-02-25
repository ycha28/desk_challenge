labelControllers = angular.module('labelControllers', [])

labelControllers.controller('LabelListController', ['$scope'
  ($scope) ->
    $scope.labels = [
      {name: 'blah'},
      {name: 'rah'}
    ]
])