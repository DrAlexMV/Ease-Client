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

		removeSuccesful = (item) ->
			$rootScope.$broadcast 'itemDeleted'

		removeUnsuccesful = () ->
			console.log 'Error deleting item'

		# Public API 
		{
		  requestItems: () ->
		  	requestWasSuccesful = no
		  	baseInventoryRequest
		  	.one('inventory')
		  	.getList().then getSuccesful, getUnsuccesful
		  getItems: () ->
		  	items	
		  removeItem: (item) ->
		  	baseInventoryRequest
		  	.one('inventory', item.sku)
		  	.remove().then removeSuccesful, removeUnsuccesful
		}
