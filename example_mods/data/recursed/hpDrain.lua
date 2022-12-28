local currentBarPorcent = 0
local heightBar = 0
local poisonAmount = 10
local disableUse = false
local beatsBeforeUse = 4
local uhohbf = false
local startthisshit = false
function onCreate()
    setProperty('skipCountdown', true)
end
function onCreatePost()
    x = screenWidth - 100
    y = 100
    makeLuaSprite('PoisonBarImage','backgrounds/recursed/poisonBar',x,y)
    scaleObject('PoisonBarImage',1.2,1.1)
    setObjectCamera('PoisonBarImage','hud')
    addLuaSprite('PoisonBarImage',true)


    makeLuaSprite('PoisonBarBg','backgrounds/recursed/PoisonBarBg',getProperty('PoisonBarImage.x') + 11,getProperty('PoisonBarImage.y'))
    setObjectCamera('PoisonBarBg','hud')
    scaleObject('PoisonBarBg',0.9,1.1)
    addLuaSprite('PoisonBarBg',false)
    
    makeLuaSprite('PosionBarBar','',getProperty('PoisonBarImage.x') + 20,getProperty('PoisonBarImage.y'))
    setObjectCamera('PosionBarBar','hud')
    makeGraphic('PosionBarBar',getProperty('PoisonBarBg.width')/2,getProperty('PoisonBarBg.height'),'FFFFFF')

    addLuaSprite('PosionBarBar',false)

    makeLuaText('fuck','joemama',0,x+33,y + 320)
    setTextSize('fuck',34);
    setTextAlignment('fuck','center')
    setTextFont('fuck','comic.ttf')
    addLuaText('fuck');

    makeLuaText('help','Press Space to reduce the poison\nBut do not spam\n',0,360,500)
    setTextSize('help',34);
    setTextAlignment('help','center')
    setTextFont('help','comic.ttf')
    setObjectCamera('help','other')
    setProperty('help.visible', false)
    addLuaText('help');

    noteTweenX('moveNoteX0', 0, -300, 0.5, 'ease');
    noteTweenX('moveNoteX1', 1, -300, 0.5, 'ease');
    noteTweenX('moveNoteX2', 2, -300, 0.5, 'ease');
    noteTweenX('moveNoteX3', 3, -300, 0.5, 'ease');

    if getPropertyFromClass('ClientPrefs', 'mechanicDifficulty') == 'Bullshit' then
	poisonAmount = 7
	end
    currentBarPorcent = 0.0

    setProperty('defaultCamZoom', 0.4)
    cameraFlash('game', '000000', 99999, false)
    setProperty('camHUD.alpha', 0)

    if difficulty == 1 then
        poisonAmount = poisonAmount + 3
    end
end
function onUpdate(elapsed)
    if currentBarPorcent == 0 then
        setGraphicSize('PosionBarBar',getProperty('PoisonBarBg.width')/1.8 * getProperty('PoisonBarBg.scale.x'),0)
    else
        setGraphicSize('PosionBarBar',getProperty('PoisonBarBg.width')/1.8 * getProperty('PoisonBarBg.scale.x'),getProperty('PoisonBarBg.height')/1.132* currentBarPorcent)
    end
    setProperty('PosionBarBar.x',getProperty('PoisonBarBg.x') + 20)
    setProperty('PosionBarBar.x',getProperty('PoisonBarBg.x') + 20)
    setProperty('PosionBarBar.y',getProperty('PoisonBarImage.y') + 305 - getProperty('PosionBarBar.height'))

    if currentBarPorcent > 1 then
        currentBarPorcent  = 1
        setProperty('health', -1)
    end
    if currentBarPorcent <= 0 then
        currentBarPorcent  = 0.0001
    end

    if getPropertyFromClass('ClientPrefs', 'mechanicDifficulty') == 'Pussy' then
        startthisshit = 0
        currentBarPorcent = 0
        setProperty('PosionBarBar.visible',false)
        setProperty('PoisonBarBG.visible',false)
        setProperty('PoisonBarImage.visible',false)
    end

    if disableUse then
    setProperty('fuck.alpha', 0.5)
    else
    setProperty('fuck.alpha', 1)
    end

    setTextString('fuck',''..poisonAmount)

    if startthisshit then
    health = getProperty('health')
	setProperty('health', health - (0.0015 * currentBarPorcent))

    if currentBarPorcent > 0.5 then
        setProperty('health', health - (0.0025 * currentBarPorcent))
    end
    end

    if keyJustPressed('space') and poisonAmount >= 1 and not disableUse and startthisshit then
    poisonAmount = poisonAmount - 1
    currentBarPorcent = currentBarPorcent - 0.3
    disableUse = true
    beatsBeforeUse = 4
    end
end
function onGameOver()
    playSound('deathlines/recurser_laugh', 5);
    playSound('deathlines/recurser_laugh', 5);
end
function onStepHit()
    if startthisshit then
    currentBarPorcent = currentBarPorcent + 0.0006
    end
    if currentBarPorcent > 0.5 and uhohbf == false then
        uhohbf = true
        if getPropertyFromClass('ClientPrefs', 'bfmodelol') == true then
        triggerEvent('Change Character', 'bf', 'bf-recursed')
        else
        triggerEvent('Change Character', 'bf', 'roland')
        end
        if flashingLights then
        cameraFlash('game', 'FFFFFF', 1, true)
        end
        playSound('iTrollYou')
    end
    if currentBarPorcent > 0.5 then
        triggerEvent('Screen Shake','0.1,0.01','0.1,0.004')
    end
    if currentBarPorcent <= 0.5 and uhohbf == true then
        uhohbf = false
        if getPropertyFromClass('ClientPrefs', 'bfmodelol') == true then
        triggerEvent('Change Character', 'bf', 'bf-og')
        else
        triggerEvent('Change Character', 'bf', 'bf')
        end
        if flashingLights then
        cameraFlash('game', 'FFFFFF', 1, true)
        end
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
    end
    
    if curStep == 64 then
        cameraFlash('game', '000000', 10, true)
        doTweenAlpha('camHUD','camHUD',0.8,6)
        startthisshit = true
    end
    if getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
    if curStep == 320 then
        doTweenAlpha('camHUD','camHUD',0.3,1.6)
        setProperty('defaultCamZoom', 0.7)
    end
    if curStep == 336 then
        doTweenAlpha('camHUD','camHUD',0.8,1.6)
        setProperty('defaultCamZoom', 0.4)
    end
    if curStep == 864 then
        doTweenAlpha('camHUD','camHUD',0.3,12.8)
        setProperty('defaultCamZoom', 0.7)
    end
    if curStep == 1088 then
        doTweenAlpha('camHUD','camHUD',0.8,4)
    end
    if curStep == 1120 then
        setProperty('defaultCamZoom', 0.4)
    end
    if curStep == 1632 then
        doTweenAlpha('camHUD','camHUD',0,35)
    end
end
end
function onSongStart()
    if getPropertyFromClass('ClientPrefs', 'mechanicDifficulty') ~= 'Pussy' then
    setProperty('help.visible', true)
    end
end
function opponentNoteHit()
    currentBarPorcent = currentBarPorcent + 0.001
    setProperty('help.visible', false)
end
function onBeatHit()
    if disableUse then
        beatsBeforeUse = beatsBeforeUse - 1
        if beatsBeforeUse <= 0 then
        disableUse = false
        end
    end
end

function missNote()
    currentBarPorcent = currentBarPorcent + 0.01
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'recursed' then
        currentBarPorcent = currentBarPorcent + 0.1
        setProperty('songMisses', (getProperty('songMisses') + 1))
        setProperty('songScore', (getProperty('songScore') - 10))
        debugPrint('Don\'t hit those!')
        triggerEvent('Screen Shake','0.1,0.01','0.1,0.004')
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('thud', 10)
        playSound('static', 10)
    end
end