'use strict';

angular.module('EaseApp')
	.factory 'InventoryFilters', ($filter) ->
		{
			hasAlarm: (arrayRef, expression) ->
				result = []
				angular.forEach arrayRef, (value, key) ->
					result.push value if value.hasAlarm
				$filter('filter') result, expression, false
			isDanger: (arrayRef, expression) ->
				result = []
				angular.forEach arrayRef, (value, key) ->
					result.push value if value.hasAlarm && value.isDanger
				$filter('filter') result, expression, false
		}
