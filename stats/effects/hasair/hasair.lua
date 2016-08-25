function init()
  self.movementParameters = config.getParameter("movementParameters", {})
  protecting=false
  effectGroupID=0
end

function update(dt)
  mcontroller.controlParameters(self.movementParameters)

  local percent = mcontroller.liquidPercentage();
  if(percent == 1) then
  	if(not protecting) then
  		protecting=true
  		effectGroupID = effect.addStatModifierGroup({{stat = "breathProtection", amount = 1}})
  	end
  elseif protecting then
  	protecting=false
  	effect.removeStatModifierGroup(effectGroupID)
  end
end