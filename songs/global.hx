import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;

function update(){
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();
     if (FlxG.keys.justPressed.F6)
        NativeAPI.allocConsole();
}