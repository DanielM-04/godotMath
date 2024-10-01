#ASTEROIDES
extends Area2D
var gravityy: Vector2 = Vector2(0, 80)
var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity += gravityy * delta
	position += velocity * delta

# esta funcion tengo que ponerla en jugador para que cuando choque le baje vida 
func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player_group")):
		GlobalVariables.lifes -=1
		if(GlobalVariables.lifes <= 0):
			get_tree().change_scene_to_file("res://Escenas/menu.tscn")
		print("game over")
		queue_free()


#Funcion para que desaparezca los enemigos de la pantalla
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	GlobalVariables.score +=1
	print("Salio de la pantalla")
	queue_free()
			
