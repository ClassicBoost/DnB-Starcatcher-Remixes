ohnowegondie = false
enable = false

function onUpdate(elapsed)

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') and enable then
    setProperty ('inCutscene', true)
    if songName ~= 'Cheating' then
    setProperty('FlxG.sound.music.volume', 0)
    setProperty('vocals.volume', 0)
    cameraFlash('other', '000000', 9999, true)
    playSound('uhOh', 1);
    runTimer('fuck', 3)
    math.randomseed(os.time());
    ohnowegondie = true
    soundName = string.format('cheaterlines/CHEATER%i', math.random(1, 3));
    playSound(soundName, 2, 'GlitchlineSND');
    else
        setProperty('health', -1)
    end
end

    if ohnowegondie then
        setPropertyFromClass('flixel.FlxG', 'music.volume', 0);
    end
end

function onTimerCompleted(fuck)
    if enable then
    loadSong('Cheating','Hell')
    end
end