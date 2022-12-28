package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"WARNING!\n
			This mod contains flashing lights! If you're
			sensitive to flashing lights, DON'T PLAY THIS MOD!
			YOU'VE BEEN WARNED!
			
			Also this mod WILL BE HARD! If you think it's too
			difficult, you can mash and/or turn off mechanics.",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			var back:Bool = controls.BACK;
			if (controls.ACCEPT || back) {
				leftState = true;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
			//	if(!back) {
			//		ClientPrefs.flashing = false;
			//		ClientPrefs.saveSettings();
			//		FlxG.sound.play(Paths.sound('confirmMenu'));
			//		FlxFlicker.flicker(warnText, 1, 0.1, false, true, function(flk:FlxFlicker) {
			//			new FlxTimer().start(0.5, function (tmr:FlxTimer) {
			//				MusicBeatState.switchState(new TitleState());
			//			});
			//		});
			//	} else {
					FlxG.sound.play(Paths.sound('cancelMenu'));
					TitleState.justbecauseIcan = false;
					FlxTween.tween(warnText, {alpha: 0}, 0.5, {
						onComplete: function (twn:FlxTween) {
							MusicBeatState.switchState(new TitleState());
						}
					});
			//	}
			}
		}
		super.update(elapsed);
	}
}
