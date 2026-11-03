extends AnimatableBody3D

@export var velocidad := 2

func abrir() -> void:
	var t := create_tween()
	t.set_ease(Tween.EASE_IN_OUT)
	t.set_trans(Tween.TRANS_ELASTIC)
	t.tween_property(self, "rotation:x",-PI/2,velocidad)
	

func cerrar() -> void:
	var t := create_tween()
	t.set_ease(Tween.EASE_OUT)
	t.set_trans(Tween.TRANS_BOUNCE)
	t.tween_property(self, "rotation:x",PI/2,velocidad)
	


func _on_b_catapulta_activado() -> void:
	pass # Replace with function body.
