class_name EffectModifier
extends RefCounted

#base class for anything that will modifiy an entiy state
#dealing damage, healing, status effects, battlefield buffs
#all of these *can* contribute to vibe in some way
var vibe_delta : Vector2i

#actually do the thing you're gonna do
#the args kind of vary for this
#just pass the action buffer in as an arg for the relevant data
#or just pass the discrete data
#that might be smarter tbh
#so a x2 modifier for example



