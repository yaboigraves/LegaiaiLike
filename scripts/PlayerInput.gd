class_name PlayerInput
extends RefCounted

#struct that contains player input data

var vertical : Vector2i
var horizontal : Vector2i
var confirm : bool
var cancel : bool


func _init(vertical : Vector2i, horizontal : Vector2i, confirm : bool, cancel:bool):
	self.vertical = vertical
	self.horizontal = horizontal;
	self.confirm = confirm
	self.cancel = cancel

