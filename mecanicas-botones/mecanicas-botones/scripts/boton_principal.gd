extends Area3D

signal activado
signal desactivado

@export var switch := false
@export var tiempo := 0.0

@onready var mesh = $mesh

var activo := false

func activar() -> void:
	if activo: return
	activo = true
	
	print("Activar boton")
	mesh.position.y = -0.09
	
	activado.emit()
	

func desactivar() -> void:
	activo = false
	print("Desactivar boton")
	mesh.position.y = 0
	
	desactivado.emit()


func _on_body_entered(_body: Node3D) -> void:
	activar()
	

func _on_body_exited(_body: Node3D) -> void:
	if tiempo > 0:
		print("Empieza el tiempo...")
		var t := get_tree().create_timer(tiempo)
		t.timeout.connect(desactivar)
		return
		
	if not switch:
		desactivar()
