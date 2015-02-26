filterServices = angular.module('filterServices', ['ngResource'])

filterServices.factory('Filter', ['$resource',
  ($resource) ->
    $resource('filters.json', {}, 
      index: {method: 'GET', isArray: true}
    )
  ])