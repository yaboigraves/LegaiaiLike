class_name EntityHud
extends Control

var health_bar : ProgressBar

func _ready() -> void:
	health_bar = $HealthBar 

func UpdateHealth(current,max):
	health_bar.max_value = max
	health_bar.value = current
	$HealthBar/HealthText.text = str(current) + "/" + str(max)

func ShowNextAction(action:Action):
	$NextMoveView.visible = true
	
