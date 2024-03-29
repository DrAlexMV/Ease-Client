'use strict'

describe 'Directive: easeModal', () ->

  # load the directive's module
  beforeEach module 'EaseApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ease-modal></ease-modal>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the easeModal directive'
