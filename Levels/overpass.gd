extends Spatial

onready var enemy = get_node("Enemy")

enum {L, R, U, D}

var path = [R, R, R, R, U, U, L, L, L, L, L, L, U, U, U, U, R, R, R, R, R, U]
var seek = 0
#warning-ignore:unused_class_variable
var _turn_limit = 25
#warning-ignore:unused_class_variable
var _perfect_score = 11

func next(fast):
	var v
	match path[seek]:
		R: v = enemy.goright(fast)
		U: v = enemy.goup(fast)
		L: v = enemy.goleft(fast)
		D: v = enemy.godown(fast)
		_: v = false
	
	if v: seek += 1
	if seek == path.size(): seek -= 1
	
	return v