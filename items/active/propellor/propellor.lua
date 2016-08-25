function init()
	sb.logWarn("[debug] Init propellor")
	self.swimDown=false
end


function update(dt, fireMode, shiftHeld, moves)
	status.addEphemeralEffect("fastSwim", 1)

	self.last=swimDown
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