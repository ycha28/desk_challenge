desk_challenge = angular.module('desk-challenge',[
  'templates',
  'ngRoute',
  'headerController',
  'caseControllers',
  'labelControllers',
  'caseServices',
  'isteven-multi-select'
])

desk_challenge.config([ '$routeProvider', 
  ($routeProvider) ->
    $routeProvider
      .when('/cases', 
        templateUrl: 'cases/index.html',
        controller: 'CaseListController'
      )
      .when('/cases/:caseId',
        templateUrl: 'cases/show.html',
        controller: 'CaseDetailController'
      )
      .when('/labels',
        templateUrl: 'labels/index.html',
        controller: 'LabelListController'
      )
      .otherwise(
        redirectTo: '/cases'
      )
])

desk_challenge.constant('statusOptions', [
  {name: 'Open', value: 'open'},
  {name: 'Pending', value: 'pending'},
  {name: 'Resolved', value: 'resolved'}
])

desk_challenge.constant('priorityOptions', [
  {name: '1', value: '1'}, 
  {name: '2', value: '2'},
  {name: '3', value: '3'},
  {name: '4', value: '4'},
  {name: '5', value: '5'},
  {name: '6', value: '6'},
  {name: '7', value: '7'},
  {name: '8', value: '8'},
  {name: '9', value: '9'},
])