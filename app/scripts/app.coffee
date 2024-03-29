'use strict'

angular.module('EaseApp', ['ui.bootstrap','smartTable.table', 'snap', 'restangular', 'googlechart'])
  .config ($routeProvider, RestangularProvider) ->
    RestangularProvider
      .setBaseUrl('http://localhost:3000/data')
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
