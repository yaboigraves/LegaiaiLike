class_name PlayerInputState
extends State

var currentEntity: PlayerControlledEntity

func enter(args = {}):
	currentEntity = args.entity
