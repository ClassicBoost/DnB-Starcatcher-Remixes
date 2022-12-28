baller = true
yesIcan = -1000
defaultY = 50

function onCreate()
	if songName == 'Opposition' then --yes this is all in order of songs creation date
	makeLuaSprite('songInfo','song info/Opposition',-1000,defaultY)
	elseif songName == 'Insane' then
	makeLuaSprite('songInfo','song info/INSANE',-1000,defaultY)
	elseif songName == 'Blocked' then
	makeLuaSprite('songInfo','song info/Blocked',-1000,defaultY)
	elseif songName == 'Polygonized' then
	makeLuaSprite('songInfo','song info/polygonized',-1000,defaultY)
	elseif songName == 'Escape From OHIO' then
	makeLuaSprite('songInfo','song info/ohio',-1000,defaultY)
	elseif songName == 'Cheating' then
	makeLuaSprite('songInfo','song info/cheating',-1000,defaultY)
	elseif songName == 'Star Theft' then
	makeLuaSprite('songInfo','song info/corn',-1000,defaultY)
	elseif songName == 'Tutorial' then
	makeLuaSprite('songInfo','song info/warm up',-1000,defaultY)
	elseif songName == 'House' then
	makeLuaSprite('songInfo','song info/house',-1000,defaultY)
	elseif songName == 'Recursed' then
	makeLuaSprite('songInfo','song info/curse',-1000,defaultY)
	elseif songName == 'Deformation' then
	makeLuaSprite('songInfo','song info/defor',-1000,defaultY)
	else
	makeLuaSprite('songInfo','song info/placeholder',-1000,defaultY)
	end
	setProperty('songInfo.scale.x', 0.8);
	setProperty('songInfo.scale.y', 0.8);

	addLuaSprite('songInfo',true)
	setObjectCamera('songInfo', 'other')

end

function onUpdate(elapsed)
	if curStep > 0 then
	setProperty('songInfo.x', yesIcan)
	if baller and yesIcan < -140 then
		yesIcan = yesIcan + 20
	end
	if baller == false and yesIcan > -1000 then
		yesIcan = yesIcan - 20
	end
end
end

function onBeatHit()
	if curBeat == 8 then
		baller = false
	end
end