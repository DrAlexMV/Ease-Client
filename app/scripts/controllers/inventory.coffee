'use strict'

angular.module('EaseApp')
	.controller 'InventoryCtrl', ($scope, InventoryItems, InventoryFilters) ->
		$scope.openNewItemForm = no
		
		InventoryItems.requestItems()
		$scope.$on 'itemsReady', () ->
			$scope.items = InventoryItems.getItems()
			console.log "Item table updated"

		$scope.items = [
			{
				sku: 1
				name: 'Colombian'
				quantity: 3
				purchasePrice: 39	
				salesPrice: 43
				isDanger: yes 
				hasAlarm: yes
			}
			{
				sku: 2 
				name: 'Brazilian'
				quantity: 2 
				purchasePrice: 9	
				salesPrice: 13
				isDanger: no 
				hasAlarm: yes 
			}
			{
				sku: 3 
				name: 'Venezuelan'
				quantity: 2 
				purchasePrice: 9	
				salesPrice: 13
			}
		]

		$scope.tableHeaders = [
			{label: "SKU", map: "sku", headerClass:"table-bordered"},
			{label: "Item Name", map: "name", headerClass:"table-bordered"},
			{label: "Quantity", map: "quantity", headerClass:"table-bordered"},
			{label: "Purchase Price", map: "purchasePrice", formatFunction: 'currency', formatParameter: '$', headerClass:"table-bordered"},
			{label: "Sales Price", map: "salesPrice", formatFunction: 'currency', formatParameter: '$', headerClass:"table-bordered"},
		]

		## Smart-table configuration
		$scope.globalConfig = {
			selectionMode: 'multiple'
			displaySelectionCheckbox: yes 
			isGlobalSearchActivated: yes 
			areTabsActivated: yes
			itemsByPage: 5 
			filterAlgorithm: {}
		}

		## Table filtering
		# $scope.$on 'allTabSelected', (event) ->
		# 	$scope.globalConfig.filterAlgorithm = {}
		# $scope.$on 'alarmTabSelected', (event) ->
		# 	$scope.globalConfig.filterAlgorithm = InventoryFilters.hasAlarmFilter 
		# $scope.$on 'warningTabSelected', (event) ->
		# 	$scope.globalConfig.filterAlgorithm = InventoryFilters.isDanger 

		## Item selection
		$scope.selectedItems = []
		$scope.$on 'selectionChange', (event, arg) ->
			if arg.item.isSelected 
				$scope.selectedItems.push arg.item
			else
				$scope.selectedItems.splice $scope.selectedItems.indexOf(arg.item), 1

		## Button Pressing
		$scope.$on 'removeButtonPressed', (event) ->
			angular.forEach $scope.selectedItems, (value, key) ->
				InventoryItems.removeItem(value)
		$scope.$on 'addButtonPressed', (event) ->
			$scope.openNewItemForm = yes 

		$scope.newItemDialogOptions = {
			backdropFade: yes
			dialogFade: yes	
		}

		$scope.closeNewItemForm = () ->
			$scope.openNewItemForm = no

