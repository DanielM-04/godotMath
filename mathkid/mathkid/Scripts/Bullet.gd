extends Area2D
var speed := 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	position.y -= speed * delta
	

#Funcion para que desaparezca de la escena el disparo
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Salioooooooooo DISPAROOOOOOOOOO")
	queue_free()


#func _on_body_entered(body: Node2D) -> void:
	#print(body.name == "enemy")
