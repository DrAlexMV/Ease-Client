'use strict'

describe 'Service: InventoryFilters', () ->

  # load the service's module
  beforeEach module 'EaseApp'

  # instantiate service
  InventoryFilters = {}
  beforeEach inject (_InventoryFilters_) ->
    InventoryFilters = _InventoryFilters_

  it 'should do something', () ->
    expect(!!InventoryFilters).toBe true
