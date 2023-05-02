package;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class SalamatScreen extends MusicBeatState
{
	var music:FlxSound;
	var left:Bool = false;
	override function create()
	{
		super.create();
		var thanks:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/salamat'));
		add(thanks);
		//FlxG.sound.play(Paths.sound('paper'));
		
		var thankss:FlxText = new FlxText(12, FlxG.height - 44, 0, "Thanks for playing", 12);
		thankss.scrollFactor.set();
		thankss.setFormat("VCR OSD MONO", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(thankss);
		var noproblemo:FlxText = new FlxText(12, FlxG.height - 24, 0, "Go to Freeplay for a Bonus Song!", 12);
		noproblemo.scrollFactor.set();
		noproblemo.setFormat("VCR OSD MONO", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(noproblemo);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT && !left)
		{
			left = true;
			MusicBeatState.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
	
}