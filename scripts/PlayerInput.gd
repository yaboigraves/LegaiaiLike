class_name PlayerInput
extends RefCounted

#struct that contains player input data

var vertical : int
var horizontal : int
var confirm : bool
var cancel : bool


func _init(vertical : int, horizontal : int, confirm : bool, cancel:bool):
	self.vertical = vertical
	self.horizontal = horizontal;
	self.confirm = confirm
	self.cancel = cancel

