package;

import openfl.Assets;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;
import spritesheet.Spritesheet;
import spritesheet.AnimatedSprite;
import spritesheet.data.BehaviorData;
import spritesheet.importers.BitmapImporter;
import spreit.SpriteLoader;

class Main extends Sprite {
    public var spritesheet:Spritesheet;
    public var sprite:AnimatedSprite;
    public var lastTime:Int;

    public function new () {
        super ();
        lastTime = 0;
        loadSpritesheet();
        addChild(sprite);
        hookEvents();
    }

    public function loadSpritesheet() {
        var columns = 6;
        var rows = 1;
        var width = 24;
        var height = 34;
        var bitmap = Assets.getBitmapData("assets/test.png");
        var spritesheet = BitmapImporter.create(
            bitmap, columns, rows, width, height);
        SpriteLoader.load(Assets.getText("assets/test.xml"));
        spritesheet.addBehavior(
            new BehaviorData("run", [0, 1, 2, 3, 4, 5], true, 24));
        spritesheet.addBehavior(new BehaviorData("stand", [0], false));
        sprite = new AnimatedSprite(spritesheet, true);
        sprite.x = 100;
        sprite.y = 100;
        sprite.showBehavior("run");
    }

    public function hookEvents() {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    public function onEnterFrame(event:Event) {
        //
        // Main game loop
        //
        var timeDelta = 0;
        var now = Lib.getTimer();
        if (lastTime == 0) {
            lastTime = now;
        } else {
            timeDelta = now - lastTime;
            lastTime = now;
        }
        sprite.update(timeDelta);
    }
}

// vim: set sts=4 sw=4 expandtab:
