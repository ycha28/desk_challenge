caseServices = angular.module('caseServices', ['ngResource'])

caseServices.factory('Case', ['$resource',
  ($resource) ->
    $resource('cases/:caseId.json', {}, 
      query: {method: 'GET', params: {caseId: ''}, isArray: true}
    )
  ])