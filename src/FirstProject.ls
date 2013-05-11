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
                private var Segment:Vector.<int> = new Vector.<int>(2);
                Segment[0] = i+4;
                Segment[1] = 5;
                SegmentList.push(Segment);
            }
        }

        public function Move(direction:String){
            var i:int;
            for (i = 0; i< this.SegmentList.length; i++){
                private var tempSegment:Vector.<int> = SegmentList[i];
                SegmentList[i][0] = SegmentList[i][0]+1;

            }
        }
    }

    public class BoardTile{
        private var posX:int;
        private var posY:int;
        public var TileImg:CCSprite;
        public var Type:String;

        public function BoardTile(indexX:int, indexY:int, type:String){
            Type = type;
            //Kann man sowas machen?
            TileImg = CCSprite.createFromFile("assets/"+Type+".png");
            TileImg.x = indexX *20 +100;
            TileImg.y = indexY *20 +100;
        } 

        public function SetType(newType:String){
            this.Type = newType;
            this.TileImg = CCSprite.createFromFile("assets/"+newType+".png");
        }
    }

public class PlayBoard{
        // To Do Boardsize Config
        public var Board:Vector.<Vector.<BoardTile>>;
        public var Snake:Snake;

        public function PlayBoard(){

            //Brett erstelen
            Board = new Vector.<Vector.<BoardTile>>(10);
            var i:int;
            for (i = 0; i< 10; i++){

                var _Board:Vector.<BoardTile> = new Vector.<BoardTile>(10);
                var j:int;
                for (j = 0; j< 10; j++){
                    var tile:BoardTile = new BoardTile(i,j, "standard");
                    _Board[j] = tile;
                }    
                Board[i] = _Board;        
            }
            //Snake erstellen
            Snake = new Snake();
            var k:int;
            for (k = 0; k < this.Snake.SegmentList.length; k++){
                Board[this.Snake.SegmentList[k][0]][this.Snake.SegmentList[k][1]].SetType("snake");
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
        public var MainBoard:PlayBoard;


        override public function run():void{      
            // Comment out this line to turn off automatic scaling.
            layer.scaleMode = ScaleMode.LETTERBOX;
        
            super.run();
            // Setup anything else, like UI, or game objects.

            MainBoard = new PlayBoard();
            var i:int;
            for (i = 0; i < 10; i++){
                var j:int;
                for(j = 0; j< 10; j++){
                    var testImg:CCSprite;
                    testImg = MainBoard.Board[i][j].TileImg;
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
            //Brett zeichnen
            var i:int;
            for (i = 0; i < 10; i++){
                var j:int;
                for(j = 0; j< 10; j++){
                    var testImg:CCSprite;
                    testImg = MainBoard.Board[i][j].TileImg;
                    testImg.scale = 1.75;
                } 
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