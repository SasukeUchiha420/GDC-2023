extends Sprite

var move_vector = Vector2.ZERO
func _ready():
	get_node("/root/Level2/TweenBoxes").connect("tween_all_completed", self, "resume_physics")
func _physics_process(delta):
		if get_node("/root/Level2/PneumaticsLayerLeft/Control").loop_imantas:
			set_physics_process(false)
			move_vector = Vector2.ZERO
			
			if position.x == 2127:
				move_vector = Vector2(0, 128)
			elif position.x == 2639:
				move_vector = Vector2(0,-128)
			elif position.x > 2127 && position.x < 2639 :
				move_vector = Vector2(128, 0)
					
			if position == Vector2(2127,392):
				move_vector = Vector2(128,0)
			elif position == Vector2(2639,392):
				move_vector = Vector2(0,-128)
			elif position == Vector2(2639,-504):
				self.position = Vector2(2127,-504)
				move_vector = Vector2(0, 128)
			

			get_node("/root/Level2/TweenBoxes").interpolate_property(self, "position", self.position ,self.position + move_vector, 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			get_node("/root/Level2/TweenBoxes").start()


func resume_physics():

	if(is_instance_valid(self)):
		set_physics_process(true)
