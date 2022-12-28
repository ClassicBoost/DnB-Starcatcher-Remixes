color = 'B7B7B7'
color2 = '5B5B5B'
function onCreate()

	makeLuaSprite('bg','backgrounds/space/deep space 2',100,-100)
	setProperty('bg.scale.x', 1.5);
	setProperty('bg.scale.y', 1.5);

	makeLuaSprite('gss','backgrounds/farm/grass lands',-700,300)
	setProperty('gss.scale.x', 0.7);
	setProperty('gss.scale.y', 0.7);

	makeLuaSprite('hills','backgrounds/farm/orangey hills',-600,150)
	setProperty('hills.scale.x', getProperty('hills.scale.x') + 0.2);
	setProperty('hills.scale.y', getProperty('hills.scale.y') + 0.2);

	makeLuaSprite('barn','backgrounds/farm/funfarmhouse',150,150)
	setProperty('barn.scale.x', getProperty('barn.scale.x') + 0.04);
	setProperty('barn.scale.y', getProperty('barn.scale.y') + 0.04);

	makeLuaSprite('corn','backgrounds/farm/cornFence',-400,50)
	setProperty('corn.scale.x', getProperty('corn.scale.x') + 0.1);
	setProperty('corn.scale.y', getProperty('corn.scale.y') + 0.1);

	makeLuaSprite('corn2','backgrounds/farm/cornFence2',900,50)
	setProperty('corn2.scale.x', getProperty('corn2.scale.x') + 0.1);
	setProperty('corn2.scale.y', getProperty('corn2.scale.y') + 0.1);

	makeLuaSprite('whiteig','backgrounds/white',0,0)
	setProperty('whiteig.scale.x', 2);
	setProperty('whiteig.scale.y', 2);
	setProperty('whiteig.alpha', 0);
	
	addLuaSprite('bg',false)
	addLuaSprite('hills',false)
	addLuaSprite('barn',false)
	addLuaSprite('gss',false)
	addLuaSprite('corn',false)
	addLuaSprite('corn2',false)
	addLuaSprite('whiteig',false)
	setScrollFactor('whiteig', 0, 0);
	setScrollFactor('bg', 0, 0);
	setScrollFactor('hills', 0.1, 0.1);
	setScrollFactor('barn', 0.5, 0.5);
	
end

function onCreatePost()
	doTweenColor('gss', 'gss',color,0.01);
	doTweenColor('hills', 'hills',color,0.01);
	doTweenColor('barn', 'barn',color,0.01);
	doTweenColor('corn', 'corn',color,0.01);
	doTweenColor('corn2', 'corn2',color,0.01);
	if songName ~= 'Reality Breaking' and songName ~= 'STAR EATER' then
	doTweenColor('dad', 'dad',color,0.01);
	end
	doTweenColor('boyfriend', 'boyfriend',color,0.001);

	if songName == 'Reality Breaking' or songName == 'STAR EATER' then
	doTweenColor('gss', 'gss',color2,0.01);
	doTweenColor('hills', 'hills',color2,0.01);
	doTweenColor('barn', 'barn',color2,0.01);
	doTweenColor('corn', 'corn',color2,0.01);
	doTweenColor('corn2', 'corn2',color2,0.01);
	doTweenColor('boyfriend', 'boyfriend',color2,0.001);
	end

	if songName == 'Indignancy' then
	setProperty('camHUD.alpha', 0)
	setProperty('whiteig.alpha', 1)
	doTweenColor('dad', 'dad','000000',0.01);
	doTweenColor('boyfriend', 'boyfriend','000000',0.001);
	end
end
function onStepHit()
	if songName == 'Indignancy' and curStep == 124 then
		doTweenAlpha('whiteig','whiteig',0,0.5)
		doTweenAlpha('camHUD','camHUD',1,0.5)
		doTweenColor('dad', 'dad',color,0.5);
		doTweenColor('boyfriend', 'boyfriend',color,0.5);
	end
	if songName == 'Indignancy' and (curStep >= 1089 and curStep <= 1100) then
		doTweenColor('gss', 'gss',color2,0.01);
		doTweenColor('hills', 'hills',color2,0.01);
		doTweenColor('barn', 'barn',color2,0.01);
		doTweenColor('corn', 'corn',color2,0.01);
		doTweenColor('corn2', 'corn2',color2,0.01);
		setProperty('vocals.volume', 0)
		doTweenColor('dad', 'dad','000000',0.001);
		doTweenColor('boyfriend', 'boyfriend',color2,0.001);
	end
	if songName == 'Indignancy' and curStep == 1687 then
		doTweenColor('gss', 'gss',color,0.01);
		doTweenColor('hills', 'hills',color,0.01);
		doTweenColor('barn', 'barn',color,0.01);
		doTweenColor('corn', 'corn',color,0.01);
		doTweenColor('corn2', 'corn2',color,0.01);
	end
	if songName == 'Reality Breaking' and curStep == 512 then
		triggerEvent('Camera Follow Pos')
		setProperty('camHUD.alpha', 1)
		if flashingLights then
		cameraFlash('game', 'FFFFFF', 1, true)
		end
		doTweenColor('gss', 'gss',color,0.01);
		doTweenColor('hills', 'hills',color,0.01);
		doTweenColor('barn', 'barn',color,0.01);
		doTweenColor('corn', 'corn',color,0.01);
		doTweenColor('corn2', 'corn2',color,0.01);
		doTweenColor('boyfriend', 'boyfriend',color,0.001);
	end
end