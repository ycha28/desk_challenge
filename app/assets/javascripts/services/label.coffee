labelServices = angular.module('labelServices', ['ngResource'])

labelServices.factory('Label', ['$resource',
  ($resource) ->
    $resource('labels.json', {}, 
      index: {method: 'GET', params: {caseId: ''}, isArray: true}
      create: {method: 'POST'}
    )
  ])