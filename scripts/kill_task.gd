extends Resource
class_name KillTask

var enemy_name: String
var required_kills: int
var reward_function: Callable
var completed := false
