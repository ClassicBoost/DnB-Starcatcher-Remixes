package;

import flixel.FlxSprite;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var sprTracker:FlxSprite;
	private var isOldIcon:Bool = false;
	private var isPlayer:Bool = false;
	private var char:String = '';
	public var charPublic:String = 'bf';

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		isOldIcon = (char == 'bf-old');
		this.isPlayer = isPlayer;
		changeIcon(char);
		scrollFactor.set();
		charPublic = char;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 12, sprTracker.y - 30);
	}

	public function swapOldIcon() {
		if(isOldIcon = !isOldIcon) changeIcon('bf-old');
		else changeIcon('bf');
	}

	private var iconOffsets:Array<Float> = [0, 0];
	public function changeIcon(char:String) {
		if(this.char != char) {
			var name:String = 'icons/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-' + char; //Older versions of psych engine's support
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/nightmares/' + char;
			if(!Paths.fileExists('images/' + name + '.png', IMAGE)) name = 'icons/icon-face'; //Prevents crash from missing icon
			var file:Dynamic = Paths.image(name);

			loadGraphic(file); //Load stupidly first for getting the file size
			switch (char) {
			case 'ryan-suffocation': //kinda creepy
			loadGraphic(file, true, Math.floor(width / 4), Math.floor(height)); //Then load it fr
			iconOffsets[0] = (width - 150) / 4;
			iconOffsets[1] = (width - 150) / 4;
			iconOffsets[2] = (width - 150) / 4;
			iconOffsets[3] = (width - 150) / 4;
			updateHitbox();

			animation.add(char, [0, 1, 2, 3], 0, false, isPlayer);
			case 'unknown','daniel-worried','bambi-joke-mad','spirit','dad','gf','damnit','roland','bf-recursed','jeri-nohope': // no winning icons :/
			loadGraphic(file, true, Math.floor(width / 2), Math.floor(height)); //Then load it fr
			iconOffsets[0] = (width - 150) / 2;
			iconOffsets[1] = (width - 150) / 2;
			iconOffsets[2] = (width - 150) / 2;
			updateHitbox();

			animation.add(char, [0, 1, 0], 0, false, isPlayer);
			default:
			loadGraphic(file, true, Math.floor(width / 3), Math.floor(height)); //Then load it fr
			iconOffsets[0] = (width - 150) / 3;
			iconOffsets[1] = (width - 150) / 3;
			iconOffsets[2] = (width - 150) / 3;
			updateHitbox();

			animation.add(char, [0, 1, 2], 0, false, isPlayer);
			}
			animation.play(char);
			this.char = char;

			antialiasing = ClientPrefs.globalAntialiasing;
			if(char.endsWith('-pixel')) {
				antialiasing = false;
			}
		}
	}

/*	override function updateHitbox()
		{
			super.updateHitbox();
			offset.x = iconOffsets[0];
			offset.y = iconOffsets[1];
		}*/

	public function getCharacter():String {
		return char;
	}
}