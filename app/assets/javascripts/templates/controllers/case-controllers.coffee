caseControllers = angular.module('caseControllers', [])

caseControllers.controller('CaseListController', [ '$scope', 'Case', '$location'
  ($scope, Case, $location) ->
    $scope.cases = Case.query()

    $scope.openCase = (client) ->
      $location.path('/cases/' + client.id)
])

caseControllers.controller('CaseDetailController', ['$scope', '$routeParams', 'Case',
  ($scope, $routeParams, Case) ->
    $scope.case = Case.get({caseId: $routeParams.caseId}, (deskCase) ->
      
    )
  ])