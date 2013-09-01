'use strict'

angular.module('EaseApp')
	.controller 'InventoryCtrl', ($scope, InventoryItems) ->
		$scope.openNewItemForm = no

		items = InventoryItems.getItems()

		$scope.people = [
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
			{sku: 70116653, name: "Besta", quantity: 23, purchasePrice: 49.73, salesPrice: 99.00, isDanger: true},
			{sku: 20220968, name: "Borgsjo", quantity: 45, purchasePrice: 29.00, salesPrice: 69.99},
			{sku: 59884560, name: "Jules", quantity: 3, purchasePrice: 10, salesPrice: 34.99, isDanger: true},
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
			{sku: 40244850, name: "Micke", quantity: 40, purchasePrice: 39.99, salesPrice: 79.99},
		]

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

