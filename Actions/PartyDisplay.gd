class_name PartyDisplay
extends Control

@export var team : Team
@export var entityDisplayPackedScene : PackedScene

func _ready() -> void:
	RefreshPartyDisplay()
	
	

func RefreshPartyDisplay():
	var entities = team.GetEntities()
	for entity in entities:
		var entityDisplay : EntityDisplay = entityDisplayPackedScene.instantiate() as EntityDisplay
		entityDisplay.LoadEntity(entity)
		$VBoxContainer.add_child(entityDisplay)
