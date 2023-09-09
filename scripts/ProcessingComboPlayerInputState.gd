class_name ProcessingComboPlayerInputState
extends PlayerInputState


@export var combo_display : ComboDisplay
var action_buffer : ActionBuffer 

#alright lets be a bit smarter with this
#so as long as we have one copy of the thingy
#we can just run it multiple times per target
#much smarter
#so lets just construct one


func enter(args={}):
	super.enter(args)
	
	
	#so yeah what do I want to write here
	#iterate over the modifiers in the array
	#do them if we need to
	#so x2 can modify the next effect
	#we can pre-process any extra stuff here
	#leave it here though
	
	
	#get the stack from the current entity
	action_buffer = current_entity.actionBuffer

	#so an entity takes these effects and ought to do this part
	
	#but the UI for the processing ought to happen here
	#so really this state grabs it and handles it
	#we can split it later just get it working to start
	
	#lets add a x2 effect
	
	#cool so args are the next trick
	#do we check type?
	#probably honestly
	#type will matter here quite a bit
	#so args can maybe vary
	
	for i in range(action_buffer.effect_modifier_queue.size()):
		var effect_mod : EffectModifier = action_buffer.effect_modifier_queue[i] as EffectModifier
		if effect_mod is DamageModifier:
			print("doing ", effect_mod.value, " damage")
			
			#go over all the targets, deal damage
			#we're going to roll with individual health for now
			#dead party members need to be rezzed before swap i think though?
			#something along those lines
			#otherwise find other ways to do targetting
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
		
		#sick
		#so we might share UI sometime with other states
		#in this case we do share the combo display
		#maybe we do something different though...
		
		$DebugTimer.start()
		
		await $DebugTimer.timeout
	
