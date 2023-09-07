class_name PlayerInput
extends RefCounted

#struct that contains player input data

var vertical : int
var horizontal : int
var confirm : bool
var cancel : bool
var up: bool
var down: bool
var left: bool
var right:bool


func _init(vertical : int, horizontal : int, confirm : bool, cancel:bool, up : bool, down: bool, left: bool, right : bool):
	self.vertical = vertical
	self.horizontal = horizontal;
	self.confirm = confirm
	self.cancel = cancel
	self.up = up
	self.down = down
	self.left = left
	self.right = right

