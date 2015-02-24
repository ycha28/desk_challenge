desk_challenge = angular.module('desk-challenge',[
  'templates',
  'ngRoute',
  'caseControllers',
  'caseServices'
])

desk_challenge.config([ '$routeProvider', 
  ($routeProvider) ->
    $routeProvider
      .when('/cases', 
        templateUrl: 'partials/case-list.html',
        controller: 'CaseListController'
      )
      .when('/cases/:caseId',
        templateUrl: 'partials/case-detail.html',
        controller: 'CaseDetailController'
      )
      .otherwise(
        redirectTo: '/cases'
      )
])