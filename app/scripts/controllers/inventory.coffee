'use strict'

angular.module('EaseApp')
	.controller 'InventoryCtrl', ($scope, InventoryItems, InventoryFilters) ->
		$scope.openNewItemForm = no
		
		InventoryItems.requestItems()
		$scope.$on 'itemsReady', () ->
			$scope.items = InventoryItems.getItems()
			console.log "Item table updated"

		$scope.items = 
		[
			{
				sku: 1
				name: 'Mug'
				category: 'Kitchen'
				quantity: 3
				purchasePrice: 39	
				salesPrice: 43
				isDanger: yes 
				hasAlarm: yes
			}
			{
				sku: 2 
				name: 'Table'
				category: 'Furniture'
				quantity: 2 
				purchasePrice: 9	
				salesPrice: 13
				isDanger: no 
				hasAlarm: yes 
			}
			{
				sku: 3 
				name: 'Chair'
				category: 'Furniture'
				quantity: 2 
				purchasePrice: 9	
				salesPrice: 13
			}
		]

		$scope.tableHeaders = [
			{label: "SKU", map: "sku", headerClass:"table-bordered"}
			{label: "Item Name", map: "name", headerClass:"table-bordered"}
			{label: "Category", map: "category", headerClass:"table-borderd"}
			{label: "Quantity", map: "quantity", headerClass:"table-bordered"}
			{label: "Purchase Price", map: "purchasePrice", formatFunction: 'currency', formatParameter: '$', headerClass:"table-bordered"}
			{label: "Sales Price", map: "salesPrice", formatFunction: 'currency', formatParameter: '$', headerClass:"table-bordered"}
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

		## Modal Dialog
		$scope.addItemModal = 
		{
			show: no 
			keyboard: yes 
			backdrop: yes 
			hide: yes
		}

		## Button Pressing
		$scope.$on 'removeButtonPressed', (event) ->
			angular.forEach $scope.selectedItems, (value, key) ->
				InventoryItems.removeItem(value)
		$scope.$on 'addButtonPressed', (event) ->
			$scope.addItemModal.show = yes 
			$scope.addItemModal.hide = no

		## Charts
		$scope.chart = {
		  "type": "PieChart",
		  "displayed": true,
		  "cssStyle": "height:200px; width:125%;",
		  "data": {
		    "cols": [
		      {
		        "id": "month",
		        "label": "Month",
		        "type": "string"
		      },
		      {
		        "id": "laptop-id",
		        "label": "Laptop",
		        "type": "number"
		      },
		      {
		        "id": "desktop-id",
		        "label": "Desktop",
		        "type": "number"
		      },
		      {
		        "id": "server-id",
		        "label": "Server",
		        "type": "number"
		      },
		      {
		        "id": "cost-id",
		        "label": "Shipping",
		        "type": "number"
		      }
		    ],
		    "rows": [
		      {
		        "c": [
		          {
		            "v": "January"
		          },
		          {
		            "v": 19,
		            "f": "42 items"
		          },
		          {
		            "v": 12,
		            "f": "Ony 12 items"
		          },
		          {
		            "v": 7,
		            "f": "7 servers"
		          },
		          {
		            "v": 4,
		            "f": "$4.00"
		          }
		        ]
		      },
		      {
		        "c": [
		          {
		            "v": "February"
		          },
		          {
		            "v": 13
		          },
		          {
		            "v": 1,
		            "f": "1 unit (Out of stock this month)"
		          },
		          {
		            "v": 12
		          },
		          {
		            "v": 2,
		            "f": "$2.00"
		          }
		        ]
		      },
		      {
		        "c": [
		          {
		            "v": "March"
		          },
		          {
		            "v": 24
		          },
		          {
		            "v": 5
		          },
		          {
		            "v": 11
		          },
		          {
		            "v": 6,
		            "f": "$6.00"
		          }
		        ]
		      }
		    ]
		  },
		  "options": {
		    "title": "Sales per month",
		    "isStacked": "true",
		    "fill": 20,
		    "displayExactValues": true,
		    "vAxis": {
		      "title": "Sales unit",
		      "gridlines": {
		        "count": 10
		      }
		    },
		    "hAxis": {
		      "title": "Date"
		    }
		  },
		  "numberFormat": {
		    "cols": [
		      {
		        "columnNum": 4,
		        "format": {
		          "prefix": "$"
		        }
		      }
		    ]
		  },
		  "view": {}
		}
