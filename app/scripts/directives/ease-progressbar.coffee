'use strict';

angular.module('EaseApp')
	.directive('easeProgressbar', () ->
		templateUrl: 'views/ease-progressbar.html'
		scope: {
			striped: '='
			percent: '='
			active: '='
		}
		restrict: 'E'
		link: (scope, element, attrs) ->
	)
