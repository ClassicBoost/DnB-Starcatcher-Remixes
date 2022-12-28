enablethislol = false
local startthisshit = false
function onCreate()
    setProperty("skipCountdown", true)
    --cameraFlash('game', '000000', 99999, false)
    --setProperty('camHUD.alpha', 0)
    --setProperty('dad.alpha', 0)
    --setProperty('healthBar.alpha', 0)
    --setProperty('healthBarBG.alpha', 0)

    makeLuaSprite('suffocating','backgrounds/suffocation',0,0)
	setObjectCamera('suffocating', 'hud');
	addLuaSprite('suffocating', true)
	setProperty('suffocating.alpha', 0)

    makeLuaSprite('anxiety','backgrounds/anxiety',0,0)
	setObjectCamera('anxiety', 'hud');
	addLuaSprite('anxiety', true)
	setProperty('anxiety.alpha', 0)
end

function onSongStart()
    --cameraFlash('game', '000000', 15, true)
end
function onUpdate(elapsed)
    if startthisshit then
        setProperty('health', getProperty('health') - 0.000015)
    end

    setProperty('anxiety.alpha', getProperty('anxiety.alpha') - 0.01)

    setProperty('suffocating.alpha', 0.7/getProperty('health'))
end

function onStepHit()
    if curStep == 256 and enablethislol then
        cameraFlash('game', 'FFFFFF', 1, true)
        setProperty('camHUD.alpha', 1)
        setProperty('dad.alpha', 1)
        playSound('Lights_Turn_On')
    end
end

function onBeatHit()
	if curBeat % 2 == 0 then
	setProperty('anxiety.alpha', 0.3/getProperty('health'))
	end
end

function opponentNoteHit()
    setProperty('health', getProperty('health') - 0.00005)
    startthisshit = true
end