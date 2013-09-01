'use strict'

angular.module('EaseApp', ['ui.bootstrap','smartTable.table', 'snap', 'restangular'])
  .config ($routeProvider, RestangularProvider) ->
    RestangularProvider
      .setBaseUrl('http://ease.herokuapp.com/data')
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/inventory',
        templateUrl: 'views/inventory.html',
        controller: 'InventoryCtrl'
      .when '/login',
        templateUrl: 'views/login.html',
        controller: 'LoginCtrl'
      .otherwise
        redirectTo: '/'
