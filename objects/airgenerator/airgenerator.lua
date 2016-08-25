function init()
	sb.logInfo("Start");
	self.interactive = config.getParameter("interactive", true)
	object.setInteractive(self.interactive)
	local enabled=false
end

function onInteraction(args)
	enabled = not enabled

end

function update(dt)
	if enabled then
		world.spawnLiquid(object.position(), 200,2)
	end
end