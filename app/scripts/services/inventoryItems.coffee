'use strict';

angular.module('EaseApp')
	.factory 'inventoryItems', (Restangular) ->
		# Service logic
		baseInventoryRequest = Restangular.all 'data/petshop/austin'
		getSuccesful = (items) ->
			console.log 'Succesful inventory pull'
			return items
		getUnsuccesful = () ->
			console.log 'Error pulling inventory items'

		# Public API 
		{
		  getItems: () ->
		  	baseInventoryRequest.getList('inventory').then getSuccesful, getUnsuccesful
		}
