local defaultNotePos = {}
local spin = 12 -- how much it moves before going the other direction
 
function onSongStart()
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
end
function onStepHit()
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
doTweenY('tween1', 'dad', 0 - 144*math.sin((currentBeat+12*12)*math.pi), 1.4)

doTweenX('tween2', 'dad', -100 - 108 *math.sin((currentBeat+12*12)*math.pi), 0.2)
if curStep >= 512 and getPropertyFromClass('ClientPrefs', 'allowModcharts') == true then
noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 - 210*math.sin((currentBeat+0*0.15)*math.pi), 0.2)
noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 - 120*math.sin((currentBeat+1*0.15)*math.pi), 0.2)
noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 - 210*math.sin((currentBeat+2*0.15)*math.pi), 0.2)
noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 - 110*math.sin((currentBeat+3*0.15)*math.pi), 0.2)
noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 15*math.sin((currentBeat+4*0.15)*math.pi), 0.2)
noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 54*math.sin((currentBeat+5*0.15)*math.pi), 0.2)
noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 52*math.sin((currentBeat+6*0.15)*math.pi), 0.2)
noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 15*math.sin((currentBeat+7*0.15)*math.pi), 0.2)
noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 - 120*math.sin((currentBeat+0*0.25)*math.pi), 0.2)
noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 - 130*math.sin((currentBeat+1*0.25)*math.pi), 0.2)
noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 - 130*math.sin((currentBeat+2*0.25)*math.pi), 0.2)
noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 - 120*math.sin((currentBeat+3*0.25)*math.pi), 0.2)
noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - 51*math.sin((currentBeat+4*0.25)*math.pi), 0.2)
noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - 51*math.sin((currentBeat+5*0.25)*math.pi), 0.2)
noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - 15*math.sin((currentBeat+6*0.25)*math.pi), 0.2)
noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - 15*math.sin((currentBeat+7*0.25)*math.pi), 0.2)
	end
end
