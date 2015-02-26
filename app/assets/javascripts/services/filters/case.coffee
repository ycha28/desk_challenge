filteredCaseServices = angular.module('filteredCaseServices', ['ngResource'])

filteredCaseServices.factory('FilteredCase', ['$resource',
  ($resource) ->
    $resource('filters/:filterId/cases.json', {}, 
      index: {method: 'GET', isArray: true}
    )
  ])