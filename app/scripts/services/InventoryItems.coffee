'use strict';

angular.module('EaseApp')
	.factory 'InventoryItems', (Restangular, $rootScope) ->
		# Service logic
		baseInventoryRequest = Restangular.all 'sweatshop/dalai-llama'
		items = {}

		## Callbacks
		getSuccesful = (inventory) ->
			console.log 'Succesful inventory pull'
			items = inventory.items
			$rootScope.$broadcast 'itemsReady'

		getUnsuccesful = (res) ->
			console.log 'Error pulling inventory items'

		# Public API 
		{
		  requestItems: () ->
		  	requestWasSuccesful = false
		  	baseInventoryRequest
		  	.one('inventory')
		  	.getList().then getSuccesful, getUnsuccesful
		  getItems: () ->
		  	items	
		}
