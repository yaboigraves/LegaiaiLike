extends State

@export var enemyActionDisplay : Control

var enemy : AIControlledEntity


func enter(_msg := {}) -> void:
	super.enter()
	
	#load the actual player that we're reading from
	enemy = _msg.enemy;
	enemy.TurnReady.connect(HandleEnemyTurnReady)
	
	enemyActionDisplay.visible = true

func HandleEnemyTurnReady():
	print("dingle bingle")
	$Timer.start()
	
	await $Timer.timeout

	enemy.TurnDone.emit(enemy)



func exit():
	super.exit()
	
	enemyActionDisplay.visible = false
	enemy.TurnReady.disconnect(HandleEnemyTurnReady)
