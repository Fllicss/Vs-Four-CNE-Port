import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxAxes;

var botplayOn = false;
var botplayTxt:FlxText;
var speedText:FlxText;

var speed:Float = 1;

function create(){
    botplayTxt = new FlxText(0, 100, 0, 'BOTPLAY', 0);
    botplayTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    botplayTxt.cameras = [camHUD];
    botplayTxt.screenCenter(0x01);
    botplayTxt.alpha = 0;
    add(botplayTxt);

    speedText = new FlxText(20, 100, FlxG.width, "speed - 1");
    speedText.alpha = 0;
	speedText.setFormat(Paths.font('vcr.ttf'), 25, -1, 'left', FlxTextBorderStyle.OUTLINE, 0xff000000);
	speedText.cameras = [camHUD];
	add(speedText);
}

function postUpdate() {
    if (FlxG.keys.justPressed.ONE){
        switch(botplayOn){
            case false:
                botplayOn = true;
                botplayTxt.alpha = 1;
            case true:
                botplayOn = false;
                botplayTxt.alpha = 0;
        } 
    }

    player.cpu = botplayOn;

    if (FlxG.keys.justPressed.TWO){ 
        speed -= 0.05;
    }
    if (FlxG.keys.justPressed.THREE){
        speed = 1;
    }
    if (FlxG.keys.justPressed.FOUR){ 
        speed += 0.05;
    }

    speedText.text = "Speed - " + speed;

    if (FlxG.keys.justPressed.FIVE) camHUD.visible = !camHUD.visible;

    FlxG.timeScale = inst.pitch = vocals.pitch = speed;
}
function onSongEnd() {
    speed = 1;
}
function destroy() {
    FlxG.timeScale = 1;
}