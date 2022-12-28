function onCreate()

	makeLuaSprite('bg','backgrounds/hell/redTunnel',-900,-400)
	setProperty('bg.scale.x', 1.7);
	setProperty('bg.scale.y', 1.7);

	addLuaSprite('bg',false)
end

function onUpdate(elapsed)
	setProperty('bg.angle', getProperty('bg.angle') + 0.01)
end