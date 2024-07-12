var blueSkyGaming:FlxSprite;
var cloud1:FlxSprite;
var cloud2:FlxSprite;
var bushes:FlxSprite;
var greenGrassgaming:FlxSprite;
var Tree1:FlxSprite;
var Tree2:FlxSprite;
var X:FunkinSprite;

function create() {
    blueSkyGaming = new FlxSprite(-1000, -800).loadGraphic(Paths.image('stages/FourBG/FOURBGSKY'));
    blueSkyGaming.antialiasing = Options.antialiasing;
    blueSkyGaming.scrollFactor.set(1,1);
    blueSkyGaming.scale.set(1.1, 1);
    blueSkyGaming.updateHitbox();
    insert(0, blueSkyGaming);
    
    cloud1 = new FlxSprite(-300, -75).loadGraphic(Paths.image('stages/FourBG/Cloud'));
    cloud1.antialiasing = Options.antialiasing;
    cloud1.scrollFactor.set(0.7, 0.9);
    cloud1.scale.set(0.9, 0.9);
    cloud1.alpha = 0.5;
    cloud1.updateHitbox();
    insert(1, cloud1);

    cloud2 = new FlxSprite(600, -125).loadGraphic(Paths.image('stages/FourBG/Cloud'));
    cloud2.antialiasing = Options.antialiasing;
    cloud2.scrollFactor.set(0.6, 0.9);
    cloud2.scale.set(0.8, 0.8);
    cloud2.alpha = 0.5;
    cloud2.updateHitbox();
    insert(1, cloud2);
    
    bushes = new FlxSprite(-900, 325).loadGraphic(Paths.image('stages/FourBG/FourBGBurntBushes'));
    bushes.scrollFactor.set(0.9, 1);
    bushes.antialiasing = Options.antialiasing;
    insert(1, bushes);

    greenGrassgaming = new FlxSprite(-1100, 480).loadGraphic(Paths.image('stages/FourBG/FourBGBurntGrass'));
    greenGrassgaming.antialiasing = Options.antialiasing;
    insert(2, greenGrassgaming);

    Tree1 = new FlxSprite(-1000, -120).loadGraphic(Paths.image('stages/FourBG/FourBurntTree'));
    Tree1.antialiasing = Options.antialiasing;
    insert(4, Tree1);

    Tree2 = new FlxSprite(950, -100).loadGraphic(Paths.image('stages/FourBG/FourBurntTree'));
    Tree2.antialiasing = Options.antialiasing;
    insert(4, Tree2);

    X = new FunkinSprite(-150, 325);
    X.antialiasing = Options.antialiasing;
    X.frames = Paths.getSparrowAtlas('stages/FourBG/XViberingScared');
    X.animation.addByPrefix('man', 'XVibingScared', 24, false); 
    X.debugMode = true;
    insert(members.indexOf(dad)-1, X); 
}

function postCreate() {
    FlxG.camera.fade(0xFFFF6721, 1, true);
}

function beatHit(curBeat) {
    if (curBeat % 2 == 0){
        X.playAnim('man', true, 'DANCE');
    }
}