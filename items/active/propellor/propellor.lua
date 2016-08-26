function init()
	--sb.logWarn("[debug] Init propellor")
	--self.swimDown=false
	set()
end


function update(dt, fireMode, shiftHeld, moves)
	status.addEphemeralEffect("fastSwim", 0.25)


  if self.fireMode == "alt" and self.lastFireMode ~= "alt" then
    self.active = not self.active
    sb.logWarn("[debug] Light toggle")
    animator.setLightActive("flashlight", self.active)
    animator.setLightActive("flashlightSpread", self.active)
    animator.playSound("flashlight")
  end
  self.lastFireMode = fireMode

  	self.aimAngle, self.facingDirection = activeItem.aimAngleAndDirection(0, activeItem.ownerAimPosition())
  	activeItem.setFacingDirection(self.facingDirection)
    activeItem.setArmAngle(self.aimAngle)
	--self.last=swimDown
	if mcontroller.liquidMovement() then
		if moves.down then
			--sb.logWarn("[debug] down")
			mcontroller.controlApproachYVelocity(-80, 60)
		elseif moves.up then
			--sb.logWarn("[debug] up")
			mcontroller.controlApproachYVelocity(80, 60)
		else
			--mcontroller.controlApproachYVelocity(-0.2, 2)
		end
	end

end

function set()
  animator.setLightActive("flashlight", true)
  animator.setLightActive("flashlightSpread", true)
  self.active = true
end

function reset()
  animator.setLightActive("flashlight", false)
  animator.setLightActive("flashlightSpread", false)
  self.active = false
end

function uninit()
  reset()
end
