'use strict'

angular.module('EaseApp')
	.controller 'LoginCtrl', ($scope, Restangular, InventoryItems) ->
		$scope.loginInformation = 
			{
				username: ''
				password: ''	
			}
		## Login callbacks
		succesfulLogin = (res) ->
			console.log res
			items = InventoryItems.getItems()
		unsuccesfulLogin = (res) ->
			console.log res 
			console.log $scope.loginInformation
		## Login 
		$scope.login = () ->
			Restangular
			.allUrl('login', 'http://ease.herokuapp.com/login')
			.post($scope.loginInformation)
			.then succesfulLogin, unsuccesfulLogin

