package
{
    import cocos2d.Cocos2DGame;
    import cocos2d.CCSprite;
    import cocos2d.ScaleMode;

    import UI.Label;

    public class Snake{
        public var SegmentList:Vector.<Vector.<int>>;
        public function Snake(){
            SegmentList = new Vector.<Vector.<int>>;

            var i:int;
            for (i = 0; i < 4; i++){
                private var Segment:Vector<int>([5, 5+i]);

                SegmentList.push(Segment);
            }
            


        }


    }

    public class BoardTile{
        private var posX:int;
        private var posY:int;
        public var TileImg:CCSprite;
        public var Type:String;

        public function BoardTile(indexX:int, indexY:int){
            Type = "test";
            TileImg = CCSprite.createFromFile("assets/tile_neutral.png");
            TileImg.x = indexX *20 +100;
            TileImg.y = indexY *20 +100;
        }  
    }

public class PlayBoard{
        // To Do Boardsize Config
        public var Board:Vector.<Vector.<BoardTile>>;

        public function PlayBoard(){
            Board = new Vector.<Vector.<BoardTile>>(10);
            var i:int;
            for (i = 0; i< 10; i++){

                var _Board:Vector.<BoardTile> = new Vector.<BoardTile>(10);
                var j:int;
                for (j = 0; j< 10; j++){
                    var tile:BoardTile = new BoardTile(i,j);
                    var test:int = 4;
                    _Board[j] = tile;
                }    
                Board[i] = _Board;        
            }
        }
    }

    public class FirstProject extends Cocos2DGame
    {
        public var lastTouchX:int        = 0;       
        public var lastTouchY:int        = 0;
        public var touching:Boolean         = false;
        public var direction:String         = "none";
        public var sprite:CCSprite;


        override public function run():void{      
            // Comment out this line to turn off automatic scaling.
            layer.scaleMode = ScaleMode.LETTERBOX;
        
            super.run();
            // Setup anything else, like UI, or game objects.
            var bg = CCSprite.createFromFile("assets/bg.png")
            bg.x = 240;
            bg.y = 160;
            bg.scale = 0.5;
            layer.addChild(bg);

            var Board:PlayBoard = new PlayBoard();
            var i:int;
            for (i = 0; i < 10; i++){
                var j:int;
                for(j = 0; j< 10; j++){
                    var testImg:CCSprite;
                    testImg = Board.Board[i][j].TileImg;
                    testImg.scale = 1.75;
                    layer.addChild(testImg);
                } 
            }

            layer.onTouchBegan = function(id:int, x:int, y:int) {
            lastTouchX = x;
            lastTouchY = y;
            }
        }


        override public function onTick()
        {
            //Console.print(lastTouchX," ", lastTouchY," ", touching);
            switch (direction){
                case "none":
                    break;

                case "up":
                    break;
                      
                case "down":
                    break;

                case "left":
                    break;

                case "right":
                    break;                    
            }
            if (direction == "up"){
                sprite.y ++;
            }           
        }

        public function onTouchBegan(_id:int, _x:Number, _y:Number):void
        {
            lastTouchX = _x;
            lastTouchY = _y;
            touching = true;
        }


        public function onTouchEnded(_id:int, _x:Number, _y:Number):void
        {
            touching = false;
        }



    }
}