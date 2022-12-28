ligma = -500
showThisCrap = false
fasttime = 0.01 
local waAngle = 360
local speentime = 1
cutsceneLMAO = false
ohfuck = true
drain = false

function onCreate()
    setProperty('skipCountdown', true)
end

function onCreatePost()
    makeLuaSprite('yes','backgrounds/polygonized/fuck ass',0,0)
	setProperty('yes.scale.x', 1);
	setProperty('yes.scale.y', 1);
    setObjectCamera('yes', 'other')

    makeLuaSprite('yes2','backgrounds/polygonized/fuck ass 2',0,0)
	setProperty('yes2.scale.x', 1);
	setProperty('yes2.scale.y', 1);
    setObjectCamera('yes2', 'other')

    --addLuaSprite('yes', true)
    --addLuaSprite('yes2', true)

    setProperty('camHUD.alpha', 0)
    setProperty('dad.alpha', 0)

    cameraFlash('game', '000000', 99999, false)
    triggerEvent('Camera Follow Pos',1000,600)
    setProperty('defaultCamZoom', 1.2)
end

function onUpdate(elapsed)
    if getProperty('allow3DNotes') == true then
        setTextString('help','MODE:\n3D\n')
        setProperty('yes.alpha', 0)
        setProperty('yes2.alpha', 1)
    else
        setTextString('help','MODE:\nNORMAL\n')
        setProperty('yes.alpha', 1)
        setProperty('yes2.alpha', 0)
    end

    if drain then
        if getPropertyFromClass('ClientPrefs', 'mechanicsDifficulty') == 'Bullshit' and getProperty('health') > 0.1 then
        setProperty('health', getProperty('health') - 0.003)
        elseif getPropertyFromClass('ClientPrefs', 'mechanicsDifficulty') == 'Normal' and getProperty('health') > 0.4 then
        setProperty('health', getProperty('health') - 0.001)
        end
    end
    if ohfuck then
        if difficulty == 1 then
        random = getRandomInt(1, 4, true)
        songPos = getSongPosition()
       local currentBeat = (songPos / 100)*(curBpm/300)
       noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * random2), 0.001)
       noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * random2), 0.001)
       noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * random2), 0.001)
       noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * random2), 0.001)
       noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
          noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - random2 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
          noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
          noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - random2 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
          noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + random2 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
          noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
          noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + random2 - random2*math.sin((currentBeat+random2*random2)*math.pi), random2)
        end
    end

    if getProperty('camHUD.angle') > 0 then
        setProperty('camHUD.angle', getProperty('camHUD.angle') - 0.2)
    end
    if getProperty('camHUD.angle') < 0 then
        setProperty('camHUD.angle', getProperty('camHUD.angle') + 0.2)
    end

    setProperty('yes.x', ligma)
    setProperty('yes2.x', ligma)

    if showThisCrap and ligma < 0 then
        ligma = ligma + 2
    end

    if showThisCrap == false then
        ligma = ligma - 2
    end
end

function goodNoteHit()
    if drain then
    setProperty('health', getProperty('health') + 0.03)
    end
end

function opponentNoteHit()
    triggerEvent('Screen Shake','0.1, 0.003','0.1, 0.003')
    random2 = getRandomInt(-10, 10, true) 
	random3 = getRandomInt(-360, 360, true) 
	songPos = getSongPosition()
	local currentBeat = (songPos/random3)*(curBpm/random3)
    if ohfuck and difficulty == 1 then
	doTweenAngle('GUITTween','camHUD', random2, 0.01)
    end
end
function onStepHit()
    songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)

    if curStep == 1 then
    cameraFlash('game', '000000', 8, true)
    end
    if curStep == 64 then
        cameraFlash('game', 'FFFFFF', 1, true)
        setProperty('camHUD.alpha', 1)
        setProperty('dad.alpha', 1)
        triggerEvent('Camera Follow Pos')
        setProperty('defaultCamZoom', 0.8)
        ohfuck = true
    end
    if curStep == 576 then
        if flashingLights then
            cameraFlash('game', 'FFFFFF', 1, true)
        end
        ohfuck = false
        setProperty('timeTxt.text', '- Unfairness -')
        setProperty('camHUD.alpha', 0.5)
        triggerEvent('Camera Follow Pos',400,300)
        setProperty('defaultCamZoom', 0.5)
        --showThisCrap = true
        setProperty('boyfriend.alpha', 0)
        setProperty('health', 2)

        setProperty('camHUD.angle', 0)
        setProperty('camGame.angle', 0)

        if getPropertyFromClass('ClientPrefs', 'bfmodelol') == true then
        triggerEvent('Change Character', 'bf', 'bf-scared-og')
        else
        triggerEvent('Change Character', 'bf', 'bf-scared')
        end

        cutsceneLMAO = true
    end
    if curStep == 832 or curStep == 904 or curStep == 960 then
        drain = true
        ohfuck = true
        cutsceneLMAO = false
        if flashingLights then
            cameraFlash('game', 'FFFFFF', 0.5, true)
        end
        setProperty('camHUD.alpha', 1)
        setProperty('boyfriend.alpha', 1)
        if curStep == 832 then
        setProperty('health', 2)
        end

        --setProperty('forcedisableGhost', false)

        setProperty('timeTxt.text', '- Cheating -')

        triggerEvent('Camera Follow Pos')
        setProperty('defaultCamZoom', 0.8)

        noteTweenX('moveNoteX0', 0, defaultOpponentStrumX0, fasttime, 'elasticIn');
        noteTweenX('moveNoteX1', 1, defaultOpponentStrumX1, fasttime, 'elasticIn');
        noteTweenX('moveNoteX2', 2, defaultOpponentStrumX2, fasttime, 'elasticIn');
        noteTweenX('moveNoteX3', 3, defaultOpponentStrumX3, fasttime, 'elasticIn');
    
        noteTweenX('moveNoteX4', 4, defaultPlayerStrumX0, fasttime, 'elasticIn');
        noteTweenX('moveNoteX5', 5, defaultPlayerStrumX1, fasttime, 'elasticIn');
        noteTweenX('moveNoteX6', 6, defaultPlayerStrumX2, fasttime, 'elasticIn');
        noteTweenX('moveNoteX7', 7, defaultPlayerStrumX3, fasttime, 'elasticIn');
    end
    if curStep == 864 or curStep == 912 then
        setProperty('boyfriend.alpha', 0)
        if flashingLights then
            cameraFlash('game', 'FFFFFF', 0.5, true)
        end
        triggerEvent('Camera Follow Pos',400,300)
        setProperty('defaultCamZoom', 0.5)

        --setProperty('forcedisableGhost', true)
        cutsceneLMAO = false
        ohfuck = false

        setProperty('timeTxt.text', '- Unfairness -')

        noteTweenX('moveNoteX0', 0, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX1', 1, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX2', 2, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX3', 3, -500, fasttime, 'elasticIn');
    
        noteTweenX('moveNoteX4', 4, 416, fasttime, 'elasticIn');
        noteTweenX('moveNoteX5', 5, 528, fasttime, 'elasticIn');
        noteTweenX('moveNoteX6', 6, 640, fasttime, 'elasticIn');
        noteTweenX('moveNoteX7', 7, 752, fasttime, 'elasticIn');
    end
    if curStep == 1344 then
        cameraFlash('game', 'FFFFFF', 1, true)
        setProperty('camHUD.alpha', 0)
        triggerEvent('Camera Follow Pos',300,400)
        setProperty('health', 2)
        drain = false
    end
    if curStep == 1346 then
        setProperty('vocals.volume', 0)
        doTweenAlpha('dad', 'dad', 0, 40);
    end
    doTweenY('tween1', 'dad', 0 - 144*math.sin((currentBeat+12*12)*math.pi), 1.4)
        
    doTweenX('tween2', 'dad', -100 - 108 *math.sin((currentBeat+12*12)*math.pi), 0.2)
end
function onTweenCompleted(tag)
    if tag == '1' then
        for i = 0, 7 do
        noteTweenAngle(i, i, waAngle , speentime, 'cubeInOut')
        waAngle = waAngle + random2
        end
    end
end
function onBeatHit()
    if ohfuck and difficulty == 1 then
    random2 = getRandomInt(-360, 360, true) 
        for i = 0, 7 do
        noteTweenAngle(i, i, waAngle , speentime, 'cubeInOut')
        waAngle = waAngle + random2
        end
    end

    if cutsceneLMAO then
        noteTweenX('moveNoteX0', 0, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX1', 1, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX2', 2, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX3', 3, -500, fasttime, 'elasticIn');
    
        noteTweenX('moveNoteX4', 4, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX5', 5, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX6', 6, -500, fasttime, 'elasticIn');
        noteTweenX('moveNoteX7', 7, -500, fasttime, 'elasticIn');
    end
end