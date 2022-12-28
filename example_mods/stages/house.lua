color = 'B7B7B7'

function onCreate()

	makeLuaSprite('bg','backgrounds/space/deep space 2',100,-100)
	setProperty('bg.scale.x', 1.5);
	setProperty('bg.scale.y', 1.5);

	makeLuaSprite('gss','backgrounds/yard/supergrass',-1000,300)
	setProperty('gss.scale.x', 0.7);
	setProperty('gss.scale.y', 0.7);

	makeLuaSprite('hills','backgrounds/yard/hills',-600,150)
	setProperty('hills.scale.x', getProperty('hills.scale.x') + 0.2);
	setProperty('hills.scale.y', getProperty('hills.scale.y') + 0.2);

	makeLuaSprite('house','backgrounds/yard/house',-550,-200)
	setProperty('house.scale.x', 0.7);
	setProperty('house.scale.y', 0.7);

	makeLuaSprite('gate','backgrounds/yard/gates',-400,50)
	setProperty('gate.scale.x', getProperty('gate.scale.x') + 0.1);
	setProperty('gate.scale.y', getProperty('gate.scale.y') + 0.1);
	
	addLuaSprite('bg',false)
	addLuaSprite('hills',false)
	addLuaSprite('gate',false)
	addLuaSprite('house',false)
	addLuaSprite('gss',false)
	setScrollFactor('bg', 0, 0);
	setScrollFactor('hills', 0.1, 0.1);
	
end

function onCreatePost()
	doTweenColor('gss', 'gss',color,0.01);
	doTweenColor('hills', 'hills',color,0.01);
	doTweenColor('house', 'house',color,0.01);
	doTweenColor('gate', 'gate',color,0.01);
	doTweenColor('dad', 'dad',color,0.01);
	doTweenColor('boyfriend', 'boyfriend',color,0.001);
end