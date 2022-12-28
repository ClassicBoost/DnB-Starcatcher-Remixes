function onCreate()

    setProperty("skipCountdown", true)

end

function onCreatePost()
    cameraFlash('game', '000000', 99999, false)
end

function onStepHit()
    if curStep == 129 then
    cameraFlash('game', '000000', 10, true)
    end
    if curStep == 640 then
        if flashingLights then
        cameraFlash('game', 'FFFFFF', 1, false)
        end
        triggerEvent('Camera Follow Pos',800, -100)
    end
    if curStep == 768 then
        if flashingLights then
        cameraFlash('game', 'FFFFFF', 1, false)
        end
        triggerEvent('Camera Follow Pos')
    end
    if curStep == 256 and flashingLights then
    cameraFlash('game', 'FFFFFF', 1, false)
    end
end