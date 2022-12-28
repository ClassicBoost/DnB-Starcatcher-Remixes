ligma = -500
drain = false
color = 'B7B7B7'

function onCreate()
    setProperty("skipCountdown", true)
    drain = false

    makeLuaSprite('bg','backgrounds/space/deep space 2',100,-100)
	setProperty('bg.scale.x', 1.5);
	setProperty('bg.scale.y', 1.5);

	makeLuaSprite('gss','backgrounds/yard/supergrass',-1000,300)
	setProperty('gss.scale.x', 0.7);
	setProperty('gss.scale.y', 0.7);

	makeLuaSprite('hills','backgrounds/yard/hills',-600,150)
	setProperty('hills.scale.x', getProperty('hills.scale.x') + 0.2);
	setProperty('hills.scale.y', getProperty('hills.scale.y') + 0.2);

	makeLuaSprite('house','backgrounds/yard/house',-550,-200)
	setProperty('house.scale.x', 0.7);
	setProperty('house.scale.y', 0.7);

	makeLuaSprite('gate','backgrounds/yard/gates',-400,50)
	setProperty('gate.scale.x', getProperty('gate.scale.x') + 0.1);
	setProperty('gate.scale.y', getProperty('gate.scale.y') + 0.1);
	
	addLuaSprite('bg',false)
	addLuaSprite('hills',false)
	addLuaSprite('gate',false)
	addLuaSprite('house',false)
	addLuaSprite('gss',false)
	setScrollFactor('bg', 0, 0);
	setScrollFactor('hills', 0.1, 0.1);
end
function onCreatePost()
    makeLuaText('help','MODE:\nNORMAL\n',0,580,480) --even with flashingLights lights off I'm still warning you
    setTextSize('help',36);
    --addLuaText('help');
    setProperty('help.visible', true)
    setTextAlignment('help', 'center')
    setObjectCamera('help', 'hud')

    makeLuaSprite('yes','backgrounds/polygonized/fuck ass',0,0)
	setProperty('yes.scale.x', 1);
	setProperty('yes.scale.y', 1);
    setObjectCamera('yes', 'other')

    makeLuaSprite('yes2','backgrounds/polygonized/fuck ass 2',0,0)
	setProperty('yes2.scale.x', 1);
	setProperty('yes2.scale.y', 1);
    setObjectCamera('yes2', 'other')

    addLuaSprite('yes', true)
    addLuaSprite('yes2', true)

    setProperty('camHUD.alpha', 0)
    cameraFlash('game', '000000', 9999, false)

    setProperty('healthBar.alpha', 0.7)
    setProperty('healthBarBG.alpha', 0.7)
    setProperty('scoreTxt.alpha', 0.7)
    setProperty('engineBar.alpha', 0.7)
    setProperty('timeTxt.alpha', 0.7)

    doTweenColor('gss', 'gss',color,0.01);
    doTweenColor('hills', 'hills',color,0.01);
    doTweenColor('house', 'house',color,0.01);
    doTweenColor('gate', 'gate',color,0.01);

    setProperty('judgementCounter.y', 500)
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

    setProperty('timeTxt.alpha', 0.7)

    if drain then
        if getPropertyFromClass('ClientPrefs', 'mechanicsDifficulty') == 'Bullshit' and getProperty('health') > 0.014 then
        setProperty('health', getProperty('health') - 0.004)
        elseif getPropertyFromClass('ClientPrefs', 'mechanicsDifficulty') == 'Normal' and getProperty('health') > 0.402 then
        setProperty('health', getProperty('health') - 0.002)
        end
        triggerEvent('Screen Shake','0.02, 0.017','0.005, 0.017')
    end

    setProperty('yes.x', ligma)
    setProperty('yes2.x', ligma)

    if curBeat > 8 and curStep < 2433 and ligma < 0 then
        ligma = ligma + 1
    end

    if curStep > 2433 then
        ligma = ligma - 1
    end
end

function onUpdatePost()
    if getProperty('cpuControlled') == true then
        setProperty('yes.alpha', 0)
        setProperty('yes2.alpha', 0)
    end
end

function onStepHit()
    if curStep == 1 then
        cameraFlash('game', '000000', 9, true)
        setProperty('bg.alpha', 0)
        setProperty('hills.alpha', 0)
        setProperty('gate.alpha', 0)
        setProperty('house.alpha', 0)
        setProperty('gss.alpha', 0)
    end
    if curStep == 128 then
        if flashingLights then
            cameraFlash('game', 'FFFFFF', 1, true)
        end
        setProperty('camHUD.alpha', 1)
    end
    if curStep == 1024 or curStep == 1536 then
        drain = true
        if flashingLights then
            setProperty('shakeCam', true)
        end
        if getPropertyFromClass('ClientPrefs', 'bfmodelol') == true then
        triggerEvent('Change Character', 'bf', 'bf-scared-og')
        else
        triggerEvent('Change Character', 'bf', 'bf-scared')
        end
        --setProperty('healthBarBG.alpha', 0.7)
        --setProperty('healthBar.alpha', 0.7)
        --setProperty('iconP1.alpha', 0.7)
        --setProperty('iconP2.alpha', 0.7)
    end
    if curStep == 1152 or curStep == 1792 then
        setProperty('shakeCam', false)
        drain = false
        if getPropertyFromClass('ClientPrefs', 'bfmodelol') == true then
        triggerEvent('Change Character', 'bf', 'bf-og')
        else
        triggerEvent('Change Character', 'bf', 'bf')
        end
        --setProperty('healthBarBG.alpha', 1)
        --setProperty('healthBar.alpha', 1)
        --setProperty('iconP1.alpha', 1)
        --setProperty('iconP2.alpha', 1)
    end
    if curStep == 2176 then
        setProperty('defaultCamZoom', 1.1)
    end
    if curStep == 2432 then
        if flashingLights then
            cameraFlash('game', 'FFFFFF', 1, true)
        end
        --setProperty('boyfriend.y', 100)
        setProperty('camHUD.alpha', 0)
        setProperty('dad.x', 100)
        setProperty('dad.y', -100)
        setProperty('bg.alpha', 1)
        setProperty('hills.alpha', 1)
        setProperty('gate.alpha', 1)
        setProperty('house.alpha', 1)
        setProperty('gss.alpha', 1)
        triggerEvent('Camera Follow Pos', 600, 500)
        setProperty('defaultCamZoom', 0.9)
    end
    if curStep == 2433 then
        doTweenColor('dad', 'dad',color,0.01);
        doTweenColor('boyfriend', 'boyfriend',color,0.001);
    end
end