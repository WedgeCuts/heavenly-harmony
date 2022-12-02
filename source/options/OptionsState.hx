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

class OptionsState extends MusicBeatState
{
	var options:Array<String> = ['notes', 'controls', 'prefs'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
	
	var menuItemz:FlxTypedGroup<FlxSprite>;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'notes':
				openSubState(new options.NotesSubState());
			case 'controls':
				openSubState(new options.ControlsSubState());
			case 'prefs':
				openSubState(new options.GraphicsSettingsSubState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/options/optioness'));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		/*
		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}*/
		
		menuItemz = new FlxTypedGroup<FlxSprite>();
		add(menuItemz);
		
		for (i in 0...options.length)
		{
			var offset:Float = 108 - (Math.max(options.length, 4) - 4) * 80;
			//Reusing the main menu code like some non lmao
			var menuItem:FlxSprite = new FlxSprite(0, 0);
			menuItem.frames = Paths.getSparrowAtlas('menus/options/buddons/options-' + options[i]);
			menuItem.animation.addByPrefix('idle', 'options-' + options[i] + " unsel", 1);
			menuItem.animation.addByPrefix('selected', 'options-' + options[i] + " sel", 1);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItemz.add(menuItem);
			var scr:Float = (options.length - 4) * 0.135;
			if(options.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.updateHitbox();
		}
		
		var overlayy:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menus/options/optionoverlay'));
		overlayy.updateHitbox();
		overlayy.screenCenter();
		overlayy.antialiasing = ClientPrefs.globalAntialiasing;
		add(overlayy);

		selectorLeft = new Alphabet(0, 0, '>', true);
		//add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true);
		//add(selectorRight);

		changeItem();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		
		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeItem(-1);
		}
		if (downP)
		{
			changeItem(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}
	}
	
	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItemz.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItemz.length - 1;
			
		FlxG.sound.play(Paths.sound('scrollMenu'));

		menuItemz.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItemz.length > 4) {
					add = menuItemz.length * 8;
				}
				spr.centerOffsets();
			}
		});
	}
	
	/*
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}*/
}