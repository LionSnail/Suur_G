extends Node

@export var bus_asset_music : BusAsset
@export var bus_asset_sfx : BusAsset
var bus : Bus

func _ready():
	bus = FMODStudioModule.get_studio_system().get_bus(bus_asset_music.path)

func change_volume(value, type):
	if !bus:
		return
	
	if type == "music":
		bus = FMODStudioModule.get_studio_system().get_bus(bus_asset_music.path)
		bus.set_volume(value)
	
	if type == "sfx":
		bus = FMODStudioModule.get_studio_system().get_bus(bus_asset_sfx.path)
		bus.set_volume(value)
