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
	
	#so yeah this structure in general is bad
	#so ui screens/states can actually end at periods
	#when they end, we notify the entity running the UI state
	#handle a screen finishing
	#so the ui just says im done
	#then the player responds?
	#no. the player input states are more like 
	#so as i was saying
	#I think we can actually merge these
	#every core game state has a UI element or animation element
	#these phases ought to be managed by one singular unit
	#so lets consolidate the system a bit
	#there is instead, one singular state machine
	#that singular state machine will keep all this phasing much cleaner
	#each state contains its own UI! 
	#so lets first move the input handler responsibilities out
	#we can even like, do a nested structure
	# intro, player turn, enemy turn, etc
	#lets do that
	#the input handler shouldn't get all that responsibility
	#cool lets start
	#this is a big refactor 
	#so first things first remove player input handler current functionality
	
	
	enemy.TurnDone.emit(enemy)



func exit():
	super.exit()
	
	enemyActionDisplay.visible = false
	enemy.TurnReady.disconnect(HandleEnemyTurnReady)
	
