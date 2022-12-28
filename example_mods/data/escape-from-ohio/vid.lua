local allowCountdown = false
function onStartCountdown()
	if not allowCountdown then --Block the first countdown
		startVideo('rps');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end