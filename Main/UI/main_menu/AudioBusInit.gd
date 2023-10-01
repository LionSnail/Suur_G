extends Node

@export var bus_asset : BusAsset
var bus : Bus

func _ready():
	bus = FMODStudioModule.get_studio_system().get_bus(bus_asset.path)
	print(bus)

func change_volume(value):
	if bus:
		print(value)
		bus.set_volume(value)
