class_name EntityIconDisplay
extends TextureRect

var currentEntity : Entity

#so when that entity gets targeted lets activate its arrow thing 

func LoadEntity(entity:Entity):
	texture = entity.entity_data.icon
	entity.Targeted.connect(HandleTargetted)
	entity.TurnStarted.connect(HandleTargetted)
	entity.TurnDone.connect(HandleUntargetted)
	entity.Untargeted.connect(HandleUntargetted)
	
func HandleTargetted():
	$SelectionArrow.visible = true

func HandleUntargetted(entity:Entity = null):
	$SelectionArrow.visible = false

