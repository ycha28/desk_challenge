caseControllers = angular.module('caseControllers', ['ngSanitize'])

caseControllers.controller('CaseListController', [ '$scope', 'Case', '$location'
  ($scope, Case, $location) ->
    $scope.cases = Case.index()

    $scope.openCase = (client) ->
      $location.path('/cases/' + client.id)
])

caseControllers.controller('CaseDetailController', ['$scope', '$routeParams', '$location', 'Case', 'statusOptions', 'priorityOptions',
  ($scope, $routeParams, $location, Case, statusOptions, priorityOptions) ->
    $scope.case = Case.show({caseId: $routeParams.caseId}, (deskCase) ->
      $scope.message = deskCase.message.body
      $scope.subject = deskCase.subject
      $scope.selectedStatus = (option for option in $scope.statusOptions when option.value == deskCase.status)[0]
      $scope.selectedPriority = (option for option in $scope.priorityOptions when option.value == deskCase.priority.toString())[0]
    )

    $scope.statusOptions = statusOptions
    $scope.priorityOptions = priorityOptions

    $scope.update = () ->
      $scope.case.status = $scope.selectedStatus.value
      $scope.case.priority = $scope.selectedPriority.value
      Case.update({caseId: $routeParams.caseId}, {case: $scope.case}, (c, putResponseHeaders) ->
        $location.path('/cases')
      )
  ])