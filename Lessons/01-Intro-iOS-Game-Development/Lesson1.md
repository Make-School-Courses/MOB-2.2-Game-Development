# Intro to iOS Game Development

## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:15      | Overview                  |
| 0:20        | 0:30      | In Class Activity I       |
| 0:50        | 0:10      | BREAK                     |
| 1:00        | 0:45      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |

## Why you should know this or industry application (optional) (5 min)

Explain why students should care to learn the material presented in this class.

## Learning Objectives (5 min)

1. Identify and describe
1. Define
1. Design
1. Implement

<!-- TOPICS:
SpriteKit, Sprites, Nodes (SKNode), scenes (SKScene), key node properties,
creating a sprite, Frames, Frame Rate and Game Loop

1.Implement:
- a simple FPS game? using SpriteKit, adding nodes and simple actions...

 -->



## Overview/TT I (20 min)

### Intro

#### What is SpriteKit

<!-- Briefly explain SpriteKit, show its historical antecedents: i.e., "before spritekit..." -->


### Quick Review: Key Classes & Concepts

#### Nodes (Sprites)
Nodes are the building blocks of SpriteKit.

A __*node*__ is an object that can be put inside a scene.

Nodes in SpriteKit are commonly referred to as __*sprites.*__

`SKNode` is the base class of all nodes.

All onscreen assets will be an `SKNode` or a subclass of it.

Example subclasses of `SKNode`:
- `SKScene` &mdash; an object that organizes all of the active SpriteKit content.
- `SKShapeNode` &mdash; renders a shape defined by a Core Graphics path
- `SKVideo` &mdash; displays video content
- `SKLabel` &mdash; displays a text label

**Node Properties** </br>
SpriteKit offers many different node types, but they all share a common set of key properties inherited from `SKNode`.

A few of the most important properties of `SKNode` and its subclasses that you can manipulate:
- `position` (CGPoint)
- `xScale` (CGFloat): representing the horizontal scale of a node
- `yScale` (CGFloat): similar to xScale but it acts in the vertical direction instead
- `alpha` (CGFloat): representing the node's transparency
- `hidden` (Bool): value determining whether or not the node should be visible
- `zRotation` (CGFloat): representing the angle, in radians, that the node should be rotated
- `zPosition` (CGFloat): used to determine which nodes should be displayed on top of other nodes in the scene

*Source:* </br>
https://code.tutsplus.com/tutorials/spritekit-from-scratch-fundamentals--cms-26326


#### SKSpriteNode
The most common `SKNode` subclass that you will use is the `SKSpriteNode` class.

An `SKSpriteNode` is a type of node that can display either a colored rectangle, or an image.

#### SKScene
An instance of the `SKScene` class represents an active scene of content in SpriteKit.

A scene is the __*root node*__ in a tree of SpriteKit nodes. This tree of nodes provides content that the scene animates and renders for display.

You can display or present a scene &mdash; that is, a collection of sprites &mdash; from inside an `SKView`, `SKRenderer`, or `WKInterfaceSKScene` object.

#### Positioning
The position of a sprite is controlled by its `position` property, which is a CGPoint (a simple struct that has two properties of its own: x and y).

```Swift  
  public struct CGPoint {
    public var x: CGFloat
    public var y: CGFloat
    // ...
  }
```

By default, SpriteKit positions sprites so they are centered at `(0, 0)`, which in SpriteKit represents the bottom left.

__*Important Note*__</br>
Unlike the coordinate systems in UIKit and AppKit &mdash; where `0` on the y-axis is at the __*top-left*__ &mdash; in SpriteKit, `0` on the y-axis is at the __*bottom-left*__ of the screen:

![XandY_in_spritekit](assets/XandY_in_spritekit.png) </br>


*Source:* </br>
https://hackernoon.com/swift-spritekit-basics-94b1798ab639


__*Simple Example:*__ </br>
Basic example of how to code for creating a sprite and setting its `position` property:

```Swift  
  // create sprite
  let myCoolSprite = SKSpriteNode(color: SKColor.red,
                          size: CGSize(width: 64, height: 64))

  // set sprite's position                        
  myCoolSprite.position = CGPoint(x: 100, y: 100)
```

##### Positioning Notes

1. When you set the position of a sprite, by default you are positioning the center of the sprite (but this can be changed by setting the sprite's `anchorPoint`).

2. A sprite’s position is within the coordinate space of its parent node. The position of any node is determined relative to the position of the `anchorPoint` of its parent.

- This means that you can add sprites as children of other sprites.
- If you do this, the child sprites will move with their parents.

#### Creating A Sprite
To create a sprite and display it to your users:

1. create an instance of `SKSpriteNode`

2. configure its `size` and `position` properties

3. add it to an `SKScene` object

- Sprites are not visible unless they are inside an `SKScene` object, which means you need to add them as children of the scene itself by calling the `addChild(_:)` method (which comes with any `SKNode` object) on the `SKScene` object in which you want your sprite to appear.

<!-- For any nodes that you want in your scene, you need to add them as children of the scene itself using the `addChild(_:)` method which comes with any `SKNode` object. -->

##### Simple Example: Creating a Sprite
Example illustrates creation of a simple, colored rectangle sprite. All you need to create it is to provide the desired size and color of the rectangle and then add it as a child to the scene you want:

```Swift  

// create sprite
  let myCoolSprite = SKSpriteNode(color: SKColor.red,
                          size: CGSize(width: 64, height: 64))

  // set sprite's position                        
  myCoolSprite.position = CGPoint(x: 100, y: 100)

  // add sprite as a child of a scene
  myScene.addChild(myCoolSprite)
```

> Note: For the example above, assume that the `myScene` object is an instance of `SKScene` previously declared outside of the code snippet shown.


#### Frame Rate & the Game Loop
When we think about "real-time" game behaviors, you might imaging objects such as players (avatars), vehicles, and other things which move around the screen in what appears to be continuous motion.

What is really happening is that the screen is redrawing itself every 1/60th of a second. And every time the screen redraws, the locations on screen of some or all of the objects change slightly.

If done quickly enough, it can fool the human eye<sup>1</sup> into believing that everything is continuously moving.

> <sup>1</sup> See "Persistence of Vision" link below...

**Frames** </br>
Game app development borrows concepts and terminology from movie and video production, as well as from traditional and digital animation.

In an iOS game app, each individual picture drawn on screen is called a __*frame*__<sup>2</sup> &mdash; just as each individual still image in a movie, animation or video is called a frame.<sup>2</sup>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![horse_in_motion_frames](assets/horse_in_motion_frames.png) </br>





 <!-- This rate of drawing is called the frame rate, or specifically frames per second (FPS).

 By default, SpriteKit displays this in the bottom-right corner of your game:
 -->




<!-- TODO:  insert graphic showing progression of frames, maybe the famous Kodak horse graphic? -->

<!-- > Disambiguation Notes:
  <sup>2</sup> frame not to be confused with the frame property on a window or UIView objects
  <sup>3</sup> -->

**Frame Rate** </br>
Games typically try to draw frames at either 30 or 60 times per second and aim to keep that rate consistent so that animations feel smooth.

This rate at which the screen is redrawn is called the __*frame rate.*__ Measured in __*frames-per-second (FPS),*__ frame rate is the measure of the total number of consecutive frame redraws done in one second.

If the frame rate is low, your game is likely performing poorly for your user.

**The Game Loop** </br>
Like most game engines, SpriteKit runs an endless rendering loop &mdash; often called a "game loop" &mdash; to update and render (redraw) the screen.

![game_loop_frame-cycle_functions](assets/game_loop_frame-cycle_functions.png) </br>

*Source:* </br>
https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events

Steps in rendering each scene typically include:
1. Updating the scene & its objects
2. Evaluate actions
3. Simulate physics
4. Apply constraints
5. Render the scene

To optimize game performance factors, including frame rate, you'll want to interact with the game loop to manage node behavior within a scene.

Example: Objects that move out of sight still consume memory, which impacts performance. The game loop offers an excellent point to evaluate status and remove them if they are no longer needed.

__*the `update(_:)` function*__ </br>
The `update(_:)` function tells your app to perform any app-specific logic to update your scene. You override it to perform per-frame game logic.

It is called exactly once per frame &mdash; before any actions are evaluated and any physics are simulated.

Because it is called each frame, it provides an excellent opportunity to interact with the game loop and update the positions of your nodes (sprites).

```Swift  
  override func update(_ currentTime: TimeInterval) {

          //TODO: Update nodes in this scene

      }
```




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

SpriteKit performs better on physical devices than it does in the Simulator, so your frame rates will appear lower than expected when running your game in the Simulator.

  Frame time: This is the total amount of time it took to draw a single frame. A frame
 time of 16.7ms is required to achieve a frame rate of 60fps.

Delta Time -- the amount of time between frames becomes important....(see ref 1 bk for more details)



## In Class Activity I (30 min)



[Space Junk](https://github.com/Make-School-Courses/MOB-2.2-Game-Development/blob/master/Lessons/01-Intro-iOS-Game-Development/assignments/activity_1_space_junk.md)

Intro to Astro Junk...

< Intro the game...explain how it will look, what it will be used for...
Demo the finished game...

>

< TODO: students to create all sprites, etc., needed in game that have been covered in TTs up to now >



## Overview/TT II (20 min)


### The 2D Coordinate system

<!-- TODO: first describe the 2D coordinate system? see ref book 1 -->

<!-- TODO: get graphics for this -->


### SKAction

<!-- TODO: Does SKAction belong in Lesson 2? -->


`SKAction` is a powerful class used to bring nodes to life.

Instances of `SKAction` are used to change the structure or content of a node in some way. They represent an animation that is executed by a node in the scene.

Examples:
- change a node’s position (or other property) over time
- change the behavior of the scene itself, such as doing a fadeout.

You can have several actions together in:
- A sequence action
- A group action
- A repeating action

When the scene processes its nodes, the actions associated with those nodes are all processed.

<!-- TODO: discuss creating and running an action. Then add a code snippet -->




### Movement with 2D vectors



A 2D vector represents a direction and a length:

<!-- TODO:  find and show a diagram -->


In the simplest terms, a vector is a value that contains two or more values. In games, vectors are most useful for describing two things: positions (i.e., coordinates) and velocities. An empty 2D vector — that is, one with just zeros — is written like this: [0, 0]. When you’re working in iOS, you can use the CGPoint structure as a 2D vector, as illustrated in Figure 6-1: let myPosition = CGPoint(x: 2, y: 2) You can also use vectors to store velocities. A velocity represents how far a location changes over time;





#### Movement with actions

#### Move action

#### Sequence action

#### Wait action

#### Run-block

#### Repeating actions

## Touch events

## Playable area limitation



<!-- Move these actions to next lesson:
#### Wait-for duration action

#### Reversing actions -->



## In Class Activity II (optional) (30 min)

# After Class

Assignments:
1. Review lesson 05-Introduction-to-SpriteKit from MOB 1.1 course
- be prepared to answer questions on key components outlined in Lesson 5

2. Review:

- Study the "Nodes that Draw" section in [Nodes for Scene Building - Apple docs](https://developer.apple.com/documentation/spritekit/nodes_for_scene_building)
- Game types:
  - RPG, FPS

  SKEffectNode
  SKWarpable protocol
  SKTexture

  `anchorPoint`

  `SKView`, `SKRenderer`, or `WKInterfaceSKScene`

- SKSceneDelegate, etc..
  https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events

  SKSceneDelegate


https://developer.apple.com/documentation/spritekit/skscenedelegate

Subclassing Scenes Versus Assigning a Delegate

https://developer.apple.com/documentation/spritekit/skscene/subclassing_scenes_versus_assigning_a_delegate





3. Delta Time

4. How do you set frame rate in SpriteKit?



## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. https://developer.apple.com/documentation/spritekit

https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events

https://en.wikipedia.org/wiki/Key_frame



https://gameprogrammingpatterns.com/state.html



[Persistence of vision: how does animation work? - an article](https://www.futurelearn.com/courses/explore-animation/0/steps/12222) <sup>1</sup>


https://developer.apple.com/documentation/spritekit/skview/1642773-preferredframespersecond


https://developer.apple.com/library/archive/documentation/3DDrawing/Conceptual/MTLBestPracticesGuide/FrameRate.html
