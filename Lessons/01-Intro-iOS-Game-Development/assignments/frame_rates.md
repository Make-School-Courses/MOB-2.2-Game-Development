# Notes on Frame Rates


By no means complete, it illustr


Understanding frame rates in iOS game development



Notes on Frame Rate:

Your application should choose a frame rate that it can consistently maintain.
The default value is 60 frames per second.

 equivalent to 16.67 ms per frame.


 Most apps target a frame rate of 60 FPS,


 However, apps that are consistently unable to complete a frame’s work within this time should target a lower frame rate to avoid jitter.





Notes on Frame Rate:

You typically want your game to run at 60fps, which will make your game look and feel smooth.

However, there are conditions in which...

<!-- This rate of drawing is called the frame rate, or specifically frames per second (FPS).

By default, SpriteKit displays this in the bottom-right corner of your game:
-->

<!--

When we talk about “real-time” games, what comes to mind are objects like the player, vehicles, and other things moving around the screen, looking like they’re in continuous motion. This isn’t actually what happens, however — what’s really going on is that the screen is redrawing itself every 1/60 of a second, and every time it does this, the locations of some or all of the objects on the screen change slightly. If this is done fast enough, the human eye is fooled into thinking that everything’s moving continuously. -->


<!-- Frame rate: Controls the rate of the animation in frames per second. Set this to 0 as this only applies when using an image that contains multiple frames. -->


888

<!-- We want to optimize frame rates... -->

You’ll get the best results if you update your game at the same rate as the screen.


if the device you’re running on can support your game at 60 fps. But less-powerful devices, which includes the simulator, can’t support that frame rate.




As the game runs, you’ll notice a rapid decrease in the frame rate. Not only does the graphics processor have to deal with increasing amounts of geometry, the physics engine has to deal with an increasing number of collisions, which also negatively affects your frame rate.



Updating every frame is the least efficient option, but it lets you change state often, which makes the game look smooth.

SpriteKit tries to draw frames as fast as possible, up to 60 FPS. However, if `update(_:)` takes too long, or if SpriteKit has to draw more sprites than the hardware can handle at one time, the frame rate might decrease.








Note: It’s handy of SpriteKit to show your frames per second onscreen by default because you want to keep an eye on the FPS as you develop your game to make sure your game is performing well. Ideally, you want at least 30 FPS.
You should only pay attention to the FPS display on an actual device, though, as you’ll get very different performance on the simulator.
In particular, your Mac has a faster CPU and way more memory than an iPhone or iPad, but abysmally slow simulated rendering, so you can’t count on any accurate performance measurements from your Mac — again, always test performance on a device!




Note: By default, SpriteKit tries to call your update method 60 times per second (roughly every 16 milliseconds).
However, if it takes too long to update and render a frame of your game, SpriteKit may call your update method less frequently, and the FPS will drop.
You can see that here — some frames are taking over 30 milliseconds. You’re seeing such a low FPS because you’re running on the simulator.
As mentioned earlier, you can’t count on the simulator for accurate performance measurements. If you try running this code on a device, you should see a much higher FPS.
Note that even if your game runs at a smooth 60 FPS, there will always be some small variance in how often SpriteKit calls your update method. Therefore, you need to take the delta time into account in your calculations — and you’ll learn how to do that next!





 <!-- Notes on Frame Rates:
  Also note that SceneKit performs much better on physical devices than it does in the simulator, so your frame rates will appear lower than expected when running your game in the simulator. -->

<!-- SpriteKit performs better on physical devices than it does in the Simulator, so your frame rates will appear lower than expected when running your game in the Simulator. -->

  Frame time: This is the total amount of time it took to draw a single frame. A frame
 time of 16.7ms is required to achieve a frame rate of 60fps.

Delta Time -- the amount of time between frames becomes important....(see ref 1 bk for more details)



<!-- This rate of drawing is called the frame rate, or specifically frames per second (FPS).

By default, SpriteKit displays this in the bottom-right corner of your game:


<!-- TODO: show image of FPS in game app  -->



<!-- TODO:  best practices: See bk 2 on 2D for " tips to keep your game running fast:" -->
