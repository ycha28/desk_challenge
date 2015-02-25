labelServices = angular.module('labelServices', ['ngResource'])

labelServices.factory('Label', ['$resource',
  ($resource) ->
    $resource('labels.json', {}, 
      index: {method: 'GET', isArray: true}
      create: {method: 'POST'}
    )
  ])