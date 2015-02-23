desk_challenge = angular.module('desk-challenge',[
  'templates',
  'ngRoute',
  'caseControllers'
])

desk_challenge.config([ '$routeProvider', 
  ($routeProvider) ->
    $routeProvider
      .when('/cases', 
        templateUrl: 'partials/case-list.html',
        controller: 'CaseListController'
      )
      .otherwise(
        redirectTo: '/cases'
      )
])