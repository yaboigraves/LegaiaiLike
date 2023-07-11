class_name EntityIconDisplay
extends TextureRect

var currentEntity : Entity

#so when that entity gets targeted lets activate its arrow thing 

func LoadEntity(entity:Entity):
	texture = entity.entityData.icon
	entity.Targeted.connect(HandleTargetted)
	entity.TurnStarted.connect(HandleTargetted)
	
func HandleTargetted():
	$SelectionArrow.visible = true
