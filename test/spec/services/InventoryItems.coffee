'use strict'

describe 'Service: InventoryItems', () ->

  # load the service's module
  beforeEach module 'EaseApp'

  # instantiate service
  InventoryItems = {}
  beforeEach inject (_InventoryItems_) ->
    InventoryItems = _InventoryItems_

  it 'should do something', () ->
    expect(!!InventoryItems).toBe true;
