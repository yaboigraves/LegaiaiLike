class_name ProcessingComboPlayerInputState
extends PlayerInputState

@export var combo_display : ComboDisplay
var action_buffer : ActionBuffer 

func enter(args={}):
	super.enter(args)
	
	action_buffer = current_entity.action_buffer
	
	for i in range(action_buffer.effect_modifier_queue.size()):
		var effect_mod : EffectModifier = action_buffer.effect_modifier_queue[i] as EffectModifier
		
		#add the effect to the total vibe state
		
		BattleBlackboard.Instance.ModifyVibe(effect_mod.vibe_delta)
		
		if effect_mod is DamageModifier:
			print("doing ", effect_mod.value, " damage")

			for target in action_buffer.targets:
				target.ApplyDamageModifier(effect_mod)
		
			
		elif effect_mod is MultiplierModifier:
			print("multiplier time")
			
			#yeah here we have to change what args we give
			#so use a dictionary for args likely
			var modifiers_to_multiply:Array[EffectModifier] = []
			
			for j in range(i + 1,  clamp(i + 1 + effect_mod.depth, 0, action_buffer.effect_modifier_queue.size())):
				
				modifiers_to_multiply.append(action_buffer.effect_modifier_queue[j])
			
			effect_mod.ApplyModifier(modifiers_to_multiply)
		
		$DebugTimer.start()
		
		await $DebugTimer.timeout
	
	print(typeof(current_entity))
	Messenger.EntityTurnDone.emit(current_entity)
