color = 'B7B7B7'

function onCreate()

	makeLuaSprite('back','backgrounds/trix/alge_back',0,0)
	setProperty('back.scale.x', 1);
	setProperty('back.scale.y', 1);

	makeLuaSprite('mid','backgrounds/trix/alge_mid',0,0)
	setProperty('mid.scale.x', 1);
	setProperty('mid.scale.y', 1);

	makeLuaSprite('front','backgrounds/trix/alge_front',0,0)
	setProperty('front.scale.x', getProperty('front.scale.x'));
	setProperty('front.scale.y', getProperty('front.scale.y'));
	
	addLuaSprite('back',false)
	addLuaSprite('mid',false)
	addLuaSprite('front',false)
	setScrollFactor('back', 0.3, 0.3);
	setScrollFactor('mid', 0.8, 0.8);
	
end

function onCreatePost()
	setProperty('boyfriend.visible', false)
end