extends State

var player : PlayerControlledEntity
@export var comboDisplay : ComboDisplay

func enter(_msg = {}):
	super.enter()
	player = _msg.player	
	comboDisplay.visible = true

	ProcessActionBuffer()
	
	
	
func ProcessActionBuffer():
	$DebugTimer.start()
	
	await $DebugTimer.timeout
	player.TurnDone.emit(player)

func exit():
	super.exit()
	comboDisplay.visible = false
