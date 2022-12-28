
fuck = false

function onCreatePost()
    debugPrint('This song may be extremely difficult!')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
        cameraShake(game, 0.02, 0.2)
        cameraSetTarget('dad')
        characterPlayAnim('gf', 'scared', true)
        doTweenZoom('camerazoom','camGame',0.55,0.15,'quadInOut')
        end

        
        function noteMiss(direction)
        setProperty('health', getProperty('health') + 0.023)
        end
        function noteMissPress(direction)
        setProperty('health', getProperty('health') + 0.023)
        end
        
    
    function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000)*(curBpm/50)
    local currentBeat = (songPos/5000)*(curBpm/75)
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end


    end

function onStepHit()
    if curStep == 1 then
        if difficulty == 1 then
        noteTweenX('moveNoteX4', 4, 416, 1, 'elasticIn');
        noteTweenX('moveNoteX5', 5, 528, 1, 'elasticIn');
        noteTweenX('moveNoteX6', 6, 640, 1, 'elasticIn');
        noteTweenX('moveNoteX7', 7, 752, 1, 'elasticIn');

        noteTweenX('moveNoteX0', 0, 416, 1, 'elasticIn');
        noteTweenX('moveNoteX1', 1, 528, 1, 'elasticIn');
        noteTweenX('moveNoteX2', 2, 640, 1, 'elasticIn');
        noteTweenX('moveNoteX3', 3, 752, 1, 'elasticIn');
        end
        for i = 0, 3 do
            noteTweenAlpha('alphaNote' .. i, i, 0.2, 1, 'ease')
        end
    end
    if curStep == 1776 then
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 1784 then
        setProperty('defaultCamZoom', 1)
    end
    if curStep == 1792 then
        setProperty('defaultCamZoom', 0.8)
    end
    if curStep == 2304 then
        if flashingLights then
        cameraFlash('game', 'FFFFFF', 1, true)
        end
        setProperty('camHUD.alpha', 0)
    end
    if curStep == 2496 then
        cameraFlash('game', '000000', 9999, true)
    end
end

function onBeatHit()
	if curBeat % 2 == 0 and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
		if fuck then
			fuck = false
            if difficulty == 1 then
			triggerEvent('Change Scroll Speed',0.3,0.35)
            else 
                triggerEvent('Change Scroll Speed',0.7,0.35)
            end
		else
			fuck = true
			triggerEvent('Change Scroll Speed',1,0.35)
		end
	end
end