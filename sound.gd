extends Node

var pitchV = 1

func _ready():
	$Skulla.play()
	
func _process(delta):
			
	$A.pitch_scale = pitchV
	$up.pitch_scale = pitchV
	$down.pitch_scale = pitchV
	$left.pitch_scale = pitchV
	$right.pitch_scale = pitchV
	
	##Notes
	if Input.is_action_just_pressed("A_button"):
		$A.play()
		$Elfo.play("A")
		$Aparticle.emitting = true
		$Timer.start()
		
	if Input.is_action_just_pressed("up_button"):
		$up.play()
		$Elfo.play("Up")
		$Upparticle.emitting = true
		$Timer.start()
		
	if Input.is_action_just_pressed("down_button"):
		$down.play()
		$Elfo.play("Down")
		$Downparticle.emitting = true
		$Timer.start()
		
	if Input.is_action_just_pressed("left_button"):
		$left.play()
		$Elfo.play("Left")
		$Leftparticle.emitting = true
		$Timer.start()
		
	if Input.is_action_just_pressed("right_button"):
		$right.play()
		$Elfo.play("Right")
		$Rightparticle.emitting = true
		$Timer.start()
	
	##pitch
	if Input.is_action_pressed("ResetPitch"):
		pitchV = 1
		
	if not Input.is_action_pressed("pitch_up") && not Input.is_action_pressed("pitch_down"):
		pitchV = 1
	#if Input.is_action_pressed("pitch_down"):
		#pitchV = 0.85
		#
	#if not Input.is_action_pressed("pitch_up") and Input.is_action_pressed("pitch_down"):
		#pitchV = 1
	
	if Input.is_action_pressed("pitch_up"):
		pitchV = remap(Input.get_action_strength("pitch_up"), -1, 1, 0.885, 1.115)
		
	if Input.is_action_pressed("pitch_down"):
		pitchV = remap(Input.get_action_strength("pitch_down"), -1, 1, 1.115, 0.885)


##Drum Loops
	if Input.is_action_just_pressed("DrumUp"):
		$DrumLeft.stop()
		$DrumUp.stop()
		$DrumRight.stop()
		$DrumUp.play()
		
	if Input.is_action_just_pressed("DrumLeft"):
		$DrumLeft.stop()
		$DrumUp.stop()
		$DrumRight.stop()
		$DrumLeft.play()
		
	if Input.is_action_just_pressed("DrumRight"):
		$DrumLeft.stop()
		$DrumUp.stop()
		$DrumRight.stop()
		$DrumRight.play()

	if Input.is_action_just_pressed("DrumDown"):
		$DrumLeft.stop()
		$DrumUp.stop()
		$DrumRight.stop()

##timer finish
func _on_timer_timeout():
	$Elfo.play("idle")
