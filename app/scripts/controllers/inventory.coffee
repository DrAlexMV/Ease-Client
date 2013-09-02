'use strict'

angular.module('EaseApp')
	.controller 'InventoryCtrl', ($scope, InventoryItems) ->
		$scope.openNewItemForm = no

		InventoryItems.requestItems()
		$scope.$on 'itemsReady', () ->
			$scope.items = InventoryItems.getItems()
			console.log "Item table updated"
			console.log $scope.items

		$scope.tableHeaders = [
			{label: "SKU", map: "sku", headerClass:"table-bordered"},
			{label: "Item Name", map: "name", headerClass:"table-bordered"},
			{label: "Quantity", map: "quantity", headerClass:"table-bordered"},
			{label: "Purchase Price", map: "purchasePrice", formatFunction: 'currency', formatParameter: '$', headerClass:"table-bordered"},
			{label: "Sales Price", map: "salesPrice", formatFunction: 'currency', formatParameter: '$', headerClass:"table-bordered"},
		]

		$scope.globalConfig = {
			selectionMode: 'multiple'
			displaySelectionCheckbox: yes 
			isGlobalSearchActivated: yes 
			areTabsActivated: yes
			itemsByPage: 5 
		}

		$scope.$on 'removeButtonPressed', (event) ->
			console.log "Remove Botton Pressed"

		$scope.$on 'addButtonPressed', (event) ->
			$scope.openNewItemForm = yes 

		$scope.newItemDialogOptions = {
			backdropFade: yes
			dialogFade: yes	
		}

		$scope.closeNewItemForm = () ->
			$scope.openNewItemForm = no

