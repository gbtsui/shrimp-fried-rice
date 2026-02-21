extends Node
class_name PlayerStateManager

enum PLAYER_STATE {
	ALIVE,
	DEAD
}

var current_state: PLAYER_STATE

func change_state(new_state: PLAYER_STATE):
	current_state = new_state
	
