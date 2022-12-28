yeayea = true
fuck = false
camShitOhNo = 0
lastNote = {0, ""}

function onCreatePost()
	cameraFlash('game', '000000', 99999, false)
	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
end

function onUpdate(elapsed)
	setProperty('camHUD.angle', camShitOhNo)

	if camShitOhNo > 0 then
		camShitOhNo = camShitOhNo - 1
	elseif camShitOhNo < 0 then
		camShitOhNo = camShitOhNo + 1
	end
end

function onStepHit()
	if curStep == 1 and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
	if difficulty == 1 then
	noteTweenX('moveNoteX0', 0, 416, 0.5, 'elasticIn');
	noteTweenX('moveNoteX1', 1, 528, 0.5, 'elasticIn');
	noteTweenX('moveNoteX2', 2, 640, 0.5, 'elasticIn');
	noteTweenX('moveNoteX3', 3, 752, 0.5, 'elasticIn');
	else
	noteTweenX('moveNoteX0', 0, -500, 0.5, 'elasticIn');
	noteTweenX('moveNoteX1', 1, -500, 0.5, 'elasticIn');
	noteTweenX('moveNoteX2', 2, -500, 0.5, 'elasticIn');
	noteTweenX('moveNoteX3', 3, -500, 0.5, 'elasticIn');
	end

	noteTweenX('moveNoteX4', 4, 416, 0.5, 'elasticIn');
	noteTweenX('moveNoteX5', 5, 528, 0.5, 'elasticIn');
	noteTweenX('moveNoteX6', 6, 640, 0.5, 'elasticIn');
	noteTweenX('moveNoteX7', 7, 752, 0.5, 'elasticIn');

	for i = 0, 3 do
		noteTweenAlpha('alphaNote' .. i, i, 0.1, 0.5, 'linear')
	end
	end

	if curStep == 128 then
		if flashingLights then
		cameraFlash('game', 'FFFFFF', 1, true)
		else
		cameraFlash('game', '000000', 1, true)
		end
		setProperty('dad.alpha', 1)
		setProperty('iconP2.alpha', 1)
	end
end

function opponentNoteHit(id,d,t,s)
	lastNote[1] = d
	lastNote[2] = t

	if lastNote[1] == 0 and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
		camShitOhNo = 30
	end
	if lastNote[1] == 3 and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
		camShitOhNo = -30
	end
end

function onBeatHit()
	if curBeat % 2 == 0 and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
		if fuck then
			fuck = false
			if difficulty == 1 then
			noteTweenX('moveNoteX0', 0, 216, 0.2, 'ease');
			noteTweenX('moveNoteX1', 1, 378, 0.2, 'ease');
			noteTweenX('moveNoteX2', 2, 770, 0.2, 'ease');
			noteTweenX('moveNoteX3', 3, 922, 0.2, 'ease');
			end
		
			noteTweenX('moveNoteX4', 4, 216, 0.2, 'ease');
			noteTweenX('moveNoteX5', 5, 378, 0.2, 'ease');
			noteTweenX('moveNoteX6', 6, 770, 0.2, 'ease');
			noteTweenX('moveNoteX7', 7, 922, 0.2, 'ease');
		else
			fuck = true
			if difficulty == 1 then
			noteTweenX('moveNoteX0', 0, 416, 0.2, 'ease');
			noteTweenX('moveNoteX1', 1, 528, 0.2, 'ease');
			noteTweenX('moveNoteX2', 2, 640, 0.2, 'ease');
			noteTweenX('moveNoteX3', 3, 752, 0.2, 'ease');
			end
		
			noteTweenX('moveNoteX4', 4, 416, 0.2, 'ease');
			noteTweenX('moveNoteX5', 5, 528, 0.2, 'ease');
			noteTweenX('moveNoteX6', 6, 640, 0.2, 'ease');
			noteTweenX('moveNoteX7', 7, 752, 0.2, 'ease');
		end
	end
end