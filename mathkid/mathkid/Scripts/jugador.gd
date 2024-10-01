extends CharacterBody2D
const speed = 250

var bullet_scene := preload("res://Escenas/Bullet.tscn")
var conteo = 0

	
func _physics_process(delta: float) -> void:
	movimientopersonaje()
	disparo()
	
	
	move_and_slide()


func disparo():
	if Input.is_action_just_released("ui_accept"):
		var bullet = bullet_scene.instantiate() 
		bullet.global_position = self.global_position
		conteo +=1
		if conteo == 5:
			print("5 disparos")
			
	
	
		get_tree().root.add_child(bullet)
		
		
#funcion colisiones con objetos#
func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Colisiones"):
		pass

	#funcion moverPersonaje
func movimientopersonaje():
	var direction1 := Input.get_axis("ui_left","ui_right")
	if  direction1:
		velocity.x = direction1 * speed
		
	else:
		velocity.x = move_toward(velocity.x,0,speed)
		
		
