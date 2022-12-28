package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class ModdedSpecificSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Modded Specific';
		rpcTitle = 'Modded Specific Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Vanilla BF',
			"Turn this on if you want to play as Boyfriend.\n(VERY UNFINISHED!)",
			'bfmodelol',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Mechanics:',
			"Wanna have a bad time? Set this to bullshit difficulty.",
			'mechanicsDifficulty',
			'string',
			'Normal',
			['Normal', 'Bullshit', 'Pussy']);
		addOption(option);

		var option:Option = new Option('Modcharts',
			"Turn this off if you don\'t want the stuff (like notes) to move.",
			'allowModcharts',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Longer Health Bar',
			"Turn this on if you want the health bar to be longer.\n(This does not give you more health)",
			'longhealthbar',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Low HP effects',
			"Turn this off if you don't want to hear your heartbeat from low health.\n(does not work in some songs)",
			'lowHPeffects',
			'bool',
			true);
		addOption(option);

		super();
	}

	function onChangeHitsoundVolume()
	{
		FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.hitsoundVolume);
	}
}