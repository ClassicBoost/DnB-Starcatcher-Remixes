function opponentNoteHit()
triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.01');
end

function onCreate()
	makeLuaSprite('anxiety','backgrounds/anxiety',0,0)
	setObjectCamera('anxiety', 'hud');
	addLuaSprite('anxiety', true)
	setProperty('anxiety.alpha', 0)
	cameraFlash('game', '000000', 99999, false)
end

function goodNoteHit()
	setProperty('health', getProperty('health') + 0.01)
end

function onUpdate(elapsed)
	if curStep == 20 then
		started = true
	end
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/1000)*(curBpm/50)
doTweenY('opponentmove', 'dad', 0 - 0*math.sin((currentBeat+12*12)*math.pi), 0)
doTweenX('disruptor2', 'disruptor2.scale', 0 - 0*math.sin((currentBeat+1*0.1)*math.pi), 0)
doTweenY('disruptor2', 'disruptor2.scale', 0 - 0*math.sin((currentBeat+1*1)*math.pi), 0)
	if started == true and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true and difficulty == 1 then
		noteTweenY('player1', 10, defaultPlayerStrumY3 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player2', 20, defaultPlayerStrumY1 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player3', 30, defaultPlayerStrumY0 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('player4', 40, defaultPlayerStrumY2 +	300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent1', 50, defaultOpponentStrumY3 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent2', 60, defaultOpponentStrumY1 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent3', 70, defaultOpponentStrumY0 + 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenY('opponent4', 80, defaultOpponentStrumY2 - 300*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx1', 90, defaultPlayerStrumX0 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx2', 100, defaultPlayerStrumX1 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx3', 110, defaultPlayerStrumX2 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('playerx4', 120, defaultPlayerStrumX3 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx1', 130, defaultOpponentStrumX0 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx2', 140, defaultOpponentStrumX1 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx3', 150, defaultOpponentStrumX2 - 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
		noteTweenX('opponentx4', 160, defaultOpponentStrumX3 + 600*math.sin((currentBeat+8*0.1)*math.pi), 3)
	end
	if getPropertyFromClass('ClientPrefs', 'allowModcharts') == true and difficulty == 1 then
	setProperty('camHUD.angle',(0 - 5 * math.cos((currentBeat2*0.25)*math.pi)))
	setProperty('camGame.angle',(0 - 5 * math.cos((currentBeat2*0.2)*math.pi)))
	end

	setProperty('anxiety.alpha', getProperty('anxiety.alpha') - 0.01)
end

function onSongStart()
	triggerEvent('Screen Shake', '20, 0.01', '20, 0.01');
	cameraFlash('game', '000000', 10, true)
end

function onBeatHit()
	if curBeat % 2 == 0 then
	if getProperty('health') < 0.7 then
	setProperty('anxiety.alpha', 0.25/getProperty('health'))
	playSound('heartbeat', 0.35/getProperty('health'))
	end
	end
end