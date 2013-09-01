'use strict'

describe 'Directive: easeNavbar', () ->
  beforeEach module 'EaseApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<ease-navbar></ease-navbar>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the easeNavbar directive'
