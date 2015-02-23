desk_challenge = angular.module('desk-challenge',[
  'templates',
  'ngRoute',
  'controllers'
])

desk_challenge.config([ '$routeProvider', 
  ($routeProvider) ->
    $routeProvider
      .when('/',
        templateUrl: 'index.html'
        controller: 'HomeController'
      )
])

controllers = angular.module('controllers', [])
controllers.controller('HomeController', [ '$scope',
  ($scope) ->
])