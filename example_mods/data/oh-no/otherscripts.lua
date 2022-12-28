function onCreatePost()
    setProperty('iconP2.alpha', 0)
end

function onStepHit()
    if curStep == 64 then
        setProperty('health', -1)
    end
end