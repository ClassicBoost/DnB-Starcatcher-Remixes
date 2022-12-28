local defaultNotePos = {}
local spin = 12 -- how much it moves before going the other direction
 
function onUpdate(elapsed)
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 1000 --How long it will take.
end
function onStepHit()
songPos = getSongPosition()
local currentBeat = (songPos/2000)*(curBpm/60)
doTweenY('tween1', 'dad', 0 - 144*math.sin((currentBeat+12*12)*math.pi), 1.4)

doTweenX('tween2', 'dad', -700 - 108 *math.sin((currentBeat+12*12)*math.pi), 0.2)
end