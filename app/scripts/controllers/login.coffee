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
		unsuccesfulLogin = (res) ->
			console.log res 
			console.log $scope.loginInformation
		## Login 
		$scope.login = () ->
			Restangular
			.allUrl('login', 'http://localhost:3000/login')
			.post($scope.loginInformation)
			.then succesfulLogin, unsuccesfulLogin

