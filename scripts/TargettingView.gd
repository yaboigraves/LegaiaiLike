class_name TargettingView
extends Node

func SetTarget(entity:Entity):
	#ahh this is bad
	#entities ought to have positions for us I think....
	#this seems to be kind of a weird downside
	#to not have that data stored
	#its pretty integral to relating entities to things...
	#yeah lets come back and fix this
	#alot of good stuff is happening though
	#$SelectionArrow.position = entity.position
	
	#TODO: refactor entities to actually have their assets
	#makes 0 sense to use UI nodes for those in the future
	#that seems important so lets do that next
	$SelectionArrow.visible = true
func ClearTarget():
	$SelectionArrow.visible = false
