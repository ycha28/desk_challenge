filteredCaseControllers = angular.module('filteredCaseControllers', [])

filteredCaseControllers.controller('FilteredCaseController', ['$scope', '$routeParams', '$location', 'FilteredCase', 'Filter'
  ($scope, $routeParams, $location, FilteredCase, Filter) ->
    $scope.filteredCases = FilteredCase.index({filterId: $routeParams.filterId})
    $scope.filters = Filter.index()

    $scope.openCase = (client) ->
      $location.path('/cases/' + client.id)
])