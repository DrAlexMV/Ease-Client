'use strict'

describe 'Directive: easeProgressbar', () ->

  # load the directive's module
  beforeEach module 'EaseApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<ease-progressbar></ease-progressbar>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the easeProgressbar directive'
