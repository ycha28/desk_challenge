caseServices = angular.module('caseServices', ['ngResource'])

caseServices.factory('Case', ['$resource',
  ($resource) ->
    $resource('cases/:caseId.json', {}, 
      index: {method: 'GET', params: {caseId: ''}, isArray: true}
      show: {method: 'GET', isArray: false}
      update: {method: 'PUT'}
    )
  ])