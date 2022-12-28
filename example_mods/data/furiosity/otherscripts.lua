ligma = -500

function onCreatePost()
    makeLuaText('help','MODE:\nNORMAL\n',0,580,480) --even with flashingLights lights off I'm still warning you
    setTextSize('help',36);
    --addLuaText('help');
    setProperty('help.visible', true)
    setTextAlignment('help', 'center')
    setObjectCamera('help', 'hud')

    makeLuaSprite('yes','backgrounds/polygonized/fuck ass',0,0)
	setProperty('yes.scale.x', 1);
	setProperty('yes.scale.y', 1);
    setObjectCamera('yes', 'other')

    makeLuaSprite('yes2','backgrounds/polygonized/fuck ass 2',0,0)
	setProperty('yes2.scale.x', 1);
	setProperty('yes2.scale.y', 1);
    setObjectCamera('yes2', 'other')

    addLuaSprite('yes', true)
    addLuaSprite('yes2', true)
end

function onUpdate(elapsed)
    if getProperty('allow3DNotes') == true then
        setTextString('help','MODE:\n3D\n')
        setProperty('yes.alpha', 0)
        setProperty('yes2.alpha', 1)
    else
        setTextString('help','MODE:\nNORMAL\n')
        setProperty('yes.alpha', 1)
        setProperty('yes2.alpha', 0)
    end

    setProperty('yes.x', ligma)
    setProperty('yes2.x', ligma)

    if curBeat > 8 and ligma < 0 then
        ligma = ligma + 1
    end
end