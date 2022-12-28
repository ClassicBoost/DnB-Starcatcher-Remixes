function onCreate()

	
	makeLuaSprite('void','backgrounds/space/deep space',250,200)
	setProperty('void.scale.x', getProperty('void.scale.x') + 2);
	setProperty('void.scale.y', getProperty('void.scale.y') + 2);

	makeLuaSprite('ship','backgrounds/inside the ship/inside',-300,-250)
	setProperty('ship.scale.x', getProperty('ship.scale.x') + 0.2);
	setProperty('ship.scale.y', getProperty('ship.scale.y') + 0.2);
	
	addLuaSprite('void',false)
	addLuaSprite('ship',false)
	setScrollFactor('void', 0, 0);
	
	

end