'use strict';

angular.module('EaseApp')
	.factory 'InventoryItems', (Restangular) ->
		# Service logic
		baseInventoryRequest = Restangular.all 'sweatshop/'
		getSuccesful = (inventory) ->
			console.log 'Succesful inventory pull'
		getUnsuccesful = (res) ->
			console.log 'Error pulling inventory items'
			console.log res

		# Public API 
		{
		  getItems: () ->
		  	baseInventoryRequest.getList('inventory').then getSuccesful, getUnsuccesful
		}
