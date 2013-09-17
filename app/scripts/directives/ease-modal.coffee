'use strict';

angular.module('EaseApp')
	.directive('easeModal', () ->
		templateUrl: 'views/ease-modal.html'
		scope: {
			options: '=options'
		}
		transclude: yes
		restrict: 'E'
		link: (scope, element, attrs) ->
			element.children('.modal').on 'hidden.bs.modal', () ->
				angular.extend scope.options, {hide: yes, show: no}
				scope.$apply()
			scope.$watch 'options', () ->
				console.log scope.options
				element.children('.modal').modal scope.options
			, yes
  	)
