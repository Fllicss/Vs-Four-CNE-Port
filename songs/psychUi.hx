import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.ui.FlxBar;

import funkin.backend.utils.CoolUtil;

public var psychText:FlxText;
var scoreTxtTween:FlxTween;

var camCombo = new FlxCamera();

var ratingFC:String = "FC";
var ratingStuff:Array<Dynamic> = [
    ['You Suck!', 0.2], //From 0% to 19%
    ['Shit', 0.4], //From 20% to 39%
    ['Bad', 0.5], //From 40% to 49%
    ['Bruh', 0.6], //From 50% to 59%
    ['Meh', 0.69], //From 60% to 68%
    ['Nice', 0.7], //69%
    ['Good', 0.8], //From 70% to 79%
    ['Great', 0.9], //From 80% to 89%
    ['Sick!', 1], //From 90% to 99%
    ['Perfect!!', 1] //The value on this one isn't used actually, since Perfect is always "1"
];

function create() {
    FlxG.cameras.add(camCombo, false);
    camCombo.bgColor = 0x00000000;

    psychText = new FlxText(0, 685, FlxG.width, "Score: 0 | Misses: 0 | Rating: ?");
    psychText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    psychText.borderSize = 1.25;
    psychText.screenCenter(FlxAxes.X);
    psychText.cameras = [camHUD];
}

function postCreate() {
    comboGroup.x -= 200;
    add(psychText);

    for (i in [missesTxt, accuracyTxt, scoreTxt])
        i.visible = false;

    if (Options.downscroll)
        psychText.y = 605;
}

function update(elapsed:Float){
    var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
    var rating:String = getRating(accuracy);
    getRatingFC(accuracy, misses);
    if (songScore > 0 || acc > 0 || misses > 0) psychText.text = "Score: " + songScore + " | Misses: " + misses +  " | Rating: " + rating + " (" + acc + "%)" + " - " + ratingFC;
}

function postUpdate(elapsed) {
    comboGroup.forEach(function(spr:FlxSprite)
		{
            spr.cameras = [camCombo];
		});

}

function getRating(accuracy:Float):String {
    if (accuracy < 0) return "?";
    for (rating in ratingStuff) if (accuracy < rating[1]) return rating[0];
    return ratingStuff[ratingStuff.length - 1][0];
}

function getRatingFC(accuracy:Float, misses:Int):String {
    if (misses == 0) {
        if (accuracy == 1.0) ratingFC = "SFC";
        else if (accuracy >= 0.99) ratingFC = "GFC";
        else ratingFC = "FC";
    }
    if (misses > 0) {
        if (misses < 10) ratingFC = "SDCB";
        else if (misses >= 10) ratingFC = "Clear";
    }
}
function onPlayerHit(e) {
    if (!e.note.isSustainNote)  doScoreBop();
}

function doScoreBop() {
    //if(!ClientPrefs.data.scoreZoom)
        //return;

    if(scoreTxtTween != null)
        scoreTxtTween.cancel();

    psychText.scale.x = 1.075;
    psychText.scale.y = 1.075;
    scoreTxtTween = FlxTween.tween(psychText.scale, {x: 1, y: 1}, 0.2, {
        onComplete: function(twn:FlxTween) {
            scoreTxtTween = null;
        }
    });
}
