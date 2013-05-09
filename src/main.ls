// THIS IS THE ENTRY POINT TO YOUR APPLICATION
// YOU DON'T WANT TO MESS WITH ANYTHING HERE
// UNLESS YOU KNOW WHAT YOU'RE DOING
package
{
    import cocos2d.Cocos2DApplication;
    import Loom.GameFramework.TimeManager;

    static class Main extends Cocos2DApplication
    {
        protected static var game:FirstProject = new FirstProject();

        public static function main()
        {
            initialize();
            onStart += game.run;   
        }
    }
}