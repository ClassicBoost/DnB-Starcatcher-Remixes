function onStepHit()
    if curStep == 136 then
        setProperty('health', 0.0001)
        cameraFlash('game', 'FFFFFF', 999999)
    end
end