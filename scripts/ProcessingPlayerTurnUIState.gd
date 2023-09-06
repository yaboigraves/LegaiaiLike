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
	#come back here, this is kind of dumb
	#yeah this is silly
	#so i want to change how this is done
	#screens have animations that must play before phasing can finish
	
	#so think about this from a player input standpoint maybe?
	#all of these ui screens need a revactor too
	#cause this coupling is bad
	#so ui screens
	
	player.TurnDone.emit(player)

func exit():
	super.exit()
	comboDisplay.visible = false
