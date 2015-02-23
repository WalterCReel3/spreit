package spreit;

import haxe.xml.Fast;

import openfl.geom.Point;
import openfl.Assets;

import spritesheet.data.BehaviorData;
import spritesheet.data.SpritesheetFrame;
import spritesheet.Spritesheet;

class SpriteLoader {
    public static function load(data:String, assetDirectory:String="") {
        //     : Spriteseet {
        // var frames = new Array();
        // var behaviors = new Map<String, BehaviorData>();
        // var frameIndex = new Map<String, Int>();

        var xml = Xml.parse(data);
        var spriteSheetNode = xml.firstElement();
        trace("I should have received the first element.");
    }
}

// vim: set sts=4 sw=4 expandtab:
