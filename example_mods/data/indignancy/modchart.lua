color = 'B7B7B7'
color2 = '5B5B5B'

function onCreate()
	makeLuaSprite('anxiety','backgrounds/anxiety',0,0)
	setObjectCamera('anxiety', 'hud');
	addLuaSprite('anxiety', true)
	setProperty('anxiety.alpha', 0)
	setProperty('skipCountdown', true)

	makeLuaSprite('pixel','backgrounds/farm/pixel (kinda)',0,0)
	setObjectCamera('pixel', 'hud');
	addLuaSprite('pixel', true)
	setProperty('pixel.alpha', 0)
end

function onStepHit()
	if curStep == 1088 then
		cameraFlash('game', 'FFFFFF', 1, true)
		setProperty('health', 1)
		if getPropertyFromClass('ClientPrefs', 'bfmodelol') == false then
		playSound('avali_hurt')
		else
		playSound('dah')
		end
		setProperty('camHUD.alpha', 0.5)
		setProperty('healthBar.alpha', 0)
		setProperty('healthBarBG.alpha', 0)
		setProperty('iconP1.alpha', 0)
		setProperty('iconP2.alpha', 0)
		setProperty('scoreTxt.alpha', 0)
		setProperty('pixel.alpha', 0.6)
		setProperty('timeTxt.text', '- ?????????? -')
		if getPropertyFromClass('ClientPrefs', 'bfmodelol') == true then
		triggerEvent('Change Character', 'bf', 'bf-scared-og')
		else
		triggerEvent('Change Character', 'bf', 'bf-scared')
		end
	end
	if curStep == 1398 then
		cameraFlash('game', 'FFFFFF', 1, true)
	end
	if curStep == 1687 then
		cameraFlash('game', 'FFFFFF', 1, true)
		doTweenColor('dad', 'dad',color,0.001);
		doTweenColor('boyfriend', 'boyfriend',color,0.001);
		setProperty('timeTxt.text', '- Supplanted -')
		setProperty('health', 1)
		setProperty('pixel.alpha', 0)
		setProperty('camHUD.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('healthBarBG.alpha', 1)
		setProperty('iconP1.alpha', 1)
		setProperty('iconP2.alpha', 1)
		setProperty('scoreTxt.alpha', 1)
	end
	if curStep == 1816 then
		triggerEvent('Camera Follow Pos', 1000, 500)
		setProperty('defaultCamZoom', 1.4)
		noteTweenX('moveNoteX0', 0, -300, 0.5, 'ease');
        noteTweenX('moveNoteX1', 1, -300, 0.5, 'ease');
        noteTweenX('moveNoteX2', 2, -300, 0.5, 'ease');
        noteTweenX('moveNoteX3', 3, -300, 0.5, 'ease');
    
        noteTweenX('moveNoteX4', 4, 416, 0.5, 'ease');
        noteTweenX('moveNoteX5', 5, 528, 0.5, 'ease');
        noteTweenX('moveNoteX6', 6, 640, 0.5, 'ease');
        noteTweenX('moveNoteX7', 7, 752, 0.5, 'ease');
	end
	if curStep == 1942 then
		triggerEvent('Camera Follow Pos')
		setProperty('defaultCamZoom', 1)
		noteTweenX('moveNoteX0', 0, defaultOpponentStrumX0, 0.5, 'ease');
        noteTweenX('moveNoteX1', 1, defaultOpponentStrumX1, 0.5, 'ease');
        noteTweenX('moveNoteX2', 2, defaultOpponentStrumX2, 0.5, 'ease');
        noteTweenX('moveNoteX3', 3, defaultOpponentStrumX3, 0.5, 'ease');
    
        noteTweenX('moveNoteX4', 4, defaultPlayerStrumX0, 0.5, 'ease');
        noteTweenX('moveNoteX5', 5, defaultPlayerStrumX1, 0.5, 'ease');
        noteTweenX('moveNoteX6', 6, defaultPlayerStrumX2, 0.5, 'ease');
        noteTweenX('moveNoteX7', 7, defaultPlayerStrumX3, 0.5, 'ease');
	end
	if curStep == 2198 then
		cameraFlash('game', 'FFFFFF', 3, true)
		setProperty('defaultCamZoom', 1.2)
		setProperty('dad.alpha', 0)
		setProperty('iconP2.alpha', 0)
		setProperty('timeTxt.text', '- ??????? ???????? -')
		playSound('stage-specific/thunder_2')
		playSound('stage-specific/thunder_2')
		playSound('stage-specific/thunder_2')
		triggerEvent('Camera Follow Pos', 1000, 450)
	end
	if curStep == 2518 then
		cameraFlash('other', '000000', 99999, true)
	end
end

function onUpdate(elapsed)
	setProperty('anxiety.alpha', getProperty('anxiety.alpha') - 0.01)
end

function onBeatHit()
	if curBeat % 2 == 0 then
	if curStep >= 1687 and curStep <= 2198 then
	setProperty('anxiety.alpha', 1)
	end
	end
end