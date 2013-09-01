'use strict'

angular.module('EaseApp')
	.controller 'LoginCtrl', ($scope, Restangular) ->
		account = Restangular.all 'login'
		$scope.loginInformation = 
			{
				username: ''
				password: ''	
			}
		succesfulLogin = (res) ->
			console.log res
		unsuccesfulLogin = () ->
			console.log "Bad"
			console.log $scope.loginInformation
		$scope.login = () ->
			account.post($scope.loginInformation).then succesfulLogin, unsuccesfulLogin


