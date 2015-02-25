caseControllers = angular.module('caseControllers', ['ngSanitize'])

caseControllers.controller('CaseListController', [ '$scope', 'Case', '$location'
  ($scope, Case, $location) ->
    $scope.cases = Case.index()
    $scope.filters = [
      {name: 'Unassigned', value: 'unassigned'},
      {name: 'All', value: 'all'}
    ]

    $scope.openCase = (client) ->
      $location.path('/cases/' + client.id)
])

caseControllers.controller('CaseDetailController', ['$scope', '$routeParams', '$location', 'Case', 'Label', 'statusOptions', 'priorityOptions',
  ($scope, $routeParams, $location, Case, Label, statusOptions, priorityOptions) ->
    $scope.case = Case.show({caseId: $routeParams.caseId}, (deskCase) ->
      $scope.message = deskCase.message.body
      $scope.subject = deskCase.subject

      $scope.selectedStatus = (option for option in $scope.statusOptions when option.value == deskCase.status)[0]
      $scope.selectedPriority = (option for option in $scope.priorityOptions when option.value == deskCase.priority.toString())[0]
    )

    $scope.statusOptions = statusOptions
    $scope.priorityOptions = priorityOptions

    # Preload selected labels
    $scope.labelOptions = Label.index((c, putResponseHeaders) ->
      @labelIds = $scope.case.labels.map (label) -> label.id
      angular.forEach($scope.labelOptions, (labelOption) ->
        if @labelIds.indexOf(labelOption.id) > -1
          labelOption.ticked = true
      )
    )

    $scope.update = () ->
      $scope.case.status = $scope.selectedStatus.value
      $scope.case.priority = $scope.selectedPriority.value
      $scope.case.label_ids = $scope.selectedLabelOptions.map (label) -> label.id

      Case.update({caseId: $routeParams.caseId}, $scope.case, (c, putResponseHeaders) ->
        $location.path('/cases')
      )
  ])