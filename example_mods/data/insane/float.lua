
function onUpdate()
if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/200)
    doTweenY(dadTweenY, 'dad', 10-240*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
end
