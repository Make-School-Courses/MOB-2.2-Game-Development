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
- `SKShapeNode`  renders a shape defined by a Core Graphics path
- `SKVideo` displays video content
- `SKLabel` displays a text label
- `SKScene` An object that organizes all of the active SpriteKit content.

**Node Properties** </br>
SpriteKit offers many different node types, but they all share a common set of key properties since they all inherit from `SKNode`.

A few of the most important properties of `SKNode` and its subclasses that you can alter:
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

A scene is the root node in a tree of SpriteKit nodes. This tree of nodes provides content that the scene animates and renders for display.

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

It is important to note that, unlike the coordinate systems in UIKit and AppKit &mdash; where `0` on the y-axis is at the __*top-left*__ &mdash; in SpriteKit, `0` on the y-axis is at the __*bottom-left*__ of the screen:

![XandY_in_spritekit](assets/XandY_in_spritekit.png) </br>


*Source:* </br>
https://hackernoon.com/swift-spritekit-basics-94b1798ab639


##### Simple Example:

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

**Frame Rate**

<DATE>  
When we talk about “real-time” games, what comes to mind are objects like the player, vehicles, and other things moving around the screen, looking like they’re in continuous motion. This isn’t actually what happens, however — what’s really going on is that the screen is redrawing itself every 1/60 of a second, and every time it does this, the locations of some or all of the objects on the screen change slightly. If this is done fast enough, the human eye is fooled into thinking that everything’s moving continuously.


<!-- Frame rate: Controls the rate of the animation in frames per second. Set this to 0 as this only applies when using an image that contains multiple frames. -->



<!-- We want to optimize frame rates... -->

You’ll get the best results if you update your game at the same rate as the screen.


Updating every frame is the least efficient option, but it lets you change state often, which makes the game look smooth.


if the device you’re running on can support your game at 60 fps. But less-powerful devices, which includes the simulator, can’t support that frame rate.


As the game runs, you’ll notice a rapid decrease in the frame rate. Not only does the graphics processor have to deal with increasing amounts of geometry, the physics engine has to deal with an increasing number of collisions, which also negatively affects your frame rate.





 fps: Stands for frames per second. This a measurement of the total amount of consecutive frame redraws done in one-second. The lower this amount, the more poorly your game is performing. You typically want your game to run at 60fps, which will make your game look and feel smooth.










 <!-- Notes on Frame Rates:
  Also note that SceneKit performs much better on physical devices than it does in the simulator, so your frame rates will appear lower than expected when running your game in the simulator. -->



  Frame time: This is the total amount of time it took to draw a single frame. A frame
 time of 16.7ms is required to achieve a frame rate of 60fps.

Delta Time -- the amount of time between frames becomes important....(see ref 1 bk for more details)



**The Game Loop**
Like most game engines, SpriteKit runs an endless rendering loop &mdash; often called a "game loop" &mdash; to render and update the screen.

![game_loop_frame-cycle_functions](assets/game_loop_frame-cycle_functions.png) </br>

*Source:* </br>
https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events

Steps in rendering each scene typically include:
1. Updating the scene & its objects - `func update(TimeInterval)` Tells your app to perform any app-specific logic to update your scene.
2. Evaluate actions
3. Simulate physics
4. Apply constraints
5. Render the scene



To run at an optimal performance level and frame rate, you’ll have to remove objects that fall out of sight. And what better place to do this than — that’s right, the render loop! Handy thing, isn’t it?


Subclassing Scenes Versus Assigning a Delegate


## In Class Activity I (30 min)

Intro to Astro Junk...

< Intro the game...explain how it will look, what it will be used for...
Demo the finished game...

>

< TODO: students to create all sprites, etc., needed in game that have been covered in TTs up to now >



## Overview/TT II (20 min)

### SKAction
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

### Movement with 2D vectors

#### Movement with actions

#### Move action

#### Sequence action

#### Wait-for duration action

#### Run-block

#### Reversing actions

#### Repeating actions

## Touch events

## Playable area limitation



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



## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. Links to additional readings and videos


https://developer.apple.com/documentation/spritekit

https://developer.apple.com/documentation/spritekit/skscene/responding_to_frame-cycle_events



http://gameprogrammingpatterns.com


https://gameprogrammingpatterns.com/state.html
