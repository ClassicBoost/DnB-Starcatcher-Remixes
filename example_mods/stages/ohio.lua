function onCreate()

	makeLuaSprite('bg','backgrounds/ohio/dear god',-900,-400)
	setProperty('bg.scale.x', 1);
	setProperty('bg.scale.y', 1);

	makeLuaSprite('brazil','backgrounds/ohio/oak',-900,-400)
	setProperty('brazil.scale.x', 1);
	setProperty('brazil.scale.y', 1);

	addLuaSprite('bg',false)
	addLuaSprite('brazil',false)
end

function onCreatePost()
	setProperty('camHUD.alpha', 0)
	setProperty('brazil.alpha', 0)
end

function onStepHit()
	if curStep == 64 then
		if flashingLights then
		cameraFlash('game', 'FFFFFF', 1, true)
		end
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 2880 then
		if flashingLights then
			cameraFlash('game', 'FFFFFF', 1, true)
		end
		setProperty('brazil.alpha', 1)
	end
end

function onUpdatePost()
	setProperty('iconP1.angle', 0)
	setProperty('iconP2.angle', 0)
end