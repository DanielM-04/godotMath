extends Node2D
@onready var jugador = $Jugador  # Esto obtiene una referencia al nodo 'Jugador'
@export var enemy_scene :PackedScene
@onready var pos1 = $EmptyPos1
@onready var pos2 = $EmptyPos2
@onready var pos3 = $EmptyPos3

var velocity = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalVariables.lifes = 3
	GlobalVariables.score = 0
	create_enemy()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	moveBackground()
	_on_timer_timeout()	

#Mover el escenario	
func moveBackground():
	$Parallax2D.scroll_offset.y +=velocity
	
#Generar el asteroide y posicion random 
func create_enemy():
	var randomPos =  RandomNumberGenerator.new().randi_range(1,3) # crea pos random
	var choicePos
	var enemy = enemy_scene.instantiate()
	
	match randomPos:
		1:
			choicePos = pos1.position.x
		2:
			choicePos = pos2.position.x
		3:
			choicePos = pos3.position.x
			
	enemy.position = Vector2(choicePos,-10)
	add_child(enemy)
	
#Velocidad del escenario a los tiros/asteroides
func _on_timer_timeout() -> void:
	if jugador.conteo == 5:
		velocity += 2.0
		print("Velocidad: ",velocity)
		jugador.conteo = 0

#crear el enemigo cada cierto tiempo 
func _on_timer_enemy_timeout() -> void:
	create_enemy()
