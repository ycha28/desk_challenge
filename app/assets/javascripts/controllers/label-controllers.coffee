labelControllers = angular.module('labelControllers', [])

labelControllers.controller('LabelListController', ['$scope', '$location', 'Label'
  ($scope, $location, Label) ->
    $scope.labels = Label.index()

    $scope.create = () ->
      Label.create(@label, (l, putRespnoseHeaders) ->
        $location.path('/cases')
      )
])