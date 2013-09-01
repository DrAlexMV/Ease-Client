'use strict';

angular.module('EaseApp')
	.directive('easeNavbar', () ->
		templateUrl: 'views/partials/ease-navbar.html'
		restrict: 'E'
		link: (scope, element, attrs) ->
			scope.alarmTabs= [
				{
					text: 'Inventory'	
					iconClass: 'icon-table icon-large'
					badgeClass: 'badge'
					badgeNotificationNumber: 5

				}
				{
					hide: true
					tabClass: 'divider'
				}
				{
					text: 'Orders'	
					iconClass: 'icon-dropbox icon-large'
					badgeClass: 'badge'
					badgeNotificationNumber: 3
				}
			]
			scope.userMenuTabs = [
				{
					text: 'Settings'
					textClass: ''
					iconClass: 'icon-cogs icon-large'	
				}
				{
					hide: true
					tabClass: 'divider'	
				}
				{
					text: 'Logout'
					textClass: ''
					iconClass: 'icon-signout icon-large'
				}
			]
	)
