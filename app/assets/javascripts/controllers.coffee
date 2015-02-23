caseControllers = angular.module('caseControllers', [])

caseControllers.controller('CaseListController', [ '$scope',
  ($scope) ->
    $scope.cases = [
      {
        "status": "OK",
        "subject": "Top 3 Features",
        "customer": "Leyla",
        "updated_at": "3 hours ago",
        "assigned": "Young Cha",
        "priority": "10"
      }
    ]
])