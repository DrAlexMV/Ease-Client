'use strict'

describe 'Controller: InventoryCtrl', () ->

  # load the controller's module
  beforeEach module 'EaseApp'

  InventoryCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    InventoryCtrl = $controller 'InventoryCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
