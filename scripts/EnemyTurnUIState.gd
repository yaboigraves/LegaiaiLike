extends State

@export var enemyActionDisplay : EnemyActionDisplay

var enemy : AIControlledEntity


func enter(_msg := {}) -> void:
	super.enter()
	
	#load the actual player that we're reading from
	enemy = _msg.enemy;
	enemy.TurnReady.connect(HandleEnemyTurnReady)
	enemy.Targeted.emit()
	enemyActionDisplay.ShowAction(enemy.selectedAction)
	enemyActionDisplay.visible = true

func HandleEnemyTurnReady(entity):

	$Timer.start()
	
	await $Timer.timeout
	
	
	enemy.TurnDone.emit(enemy)



func exit():
	super.exit()
	
	enemyActionDisplay.visible = false
	enemy.TurnReady.disconnect(HandleEnemyTurnReady)
	
