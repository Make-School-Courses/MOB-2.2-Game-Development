# Adding “Juice” & Working With Scenes

<!-- INSTRUCTOR NOTES:
1) Quiz for Initial Exercise is located: -->


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

<!-- to really engage your users and hold their interest...add:

to really add depth and dimension to the user experience.

But to really entertain and delight your users &mdash; to get users to engage with your game...

- Scenes
- "Juice" -->

## Learning Objectives (5 min)

1. Identify and describe
1. Define
1. Design
1. Implement


<!-- From outline reworked on 8/6/19:

Class 4: Adding “Juice” & Working With Scenes
TV - Creating scenes (with custom init)
Could we use the Space game and add levels? Will that adequately illustrate creating multiple scenes?
TV - Changing scenes
Game mechanics (win/lose conditions)
TV - Creating a menus
TV - Background music
TV - Sound action
AG Particle systems (SpriteKit)
	Activity:
Add explosions? Collisions? Between meteors and the ship
Fire to the ship as it flies
Debugging and/or testing

-->


<!-- from Original Outline doc, prior to 8/6/19:
Class 4: Adding “Juice” & Working With Scenes
AG Particle systems (SpriteKit)
	Activity:
Add explosions? Collisions? Between meteors and the ship
Fire to the ship as it flies
Debugging and/or testing
TV - Background music
TV - Sound action
TV - Creating scenes (with custom init)
Could we use the Space game and add levels? Will that adequately illustrate creating multiple scenes?
TV - Changing scenes
TV - Creating a menus
Saving/Loading -->



## Initial Exercise (20 min)




## Working with Scenes [Overview/TT I] (20 min)
Up to now, you've been working with game environments comprised of only a single scene.

This is fine for learning how to add basic functionality like elements and actions.

But to really delight and engage your users, you'll want them to have more opportunities to interact with your game than a single scene can provide.

You've probably also noticed that most games come with a very common set of standard features which often include:

- A Loading scene &mdash; Scene to display while other content is loading.
- Menus &mdash; Uses might include showing the game's logo, starting a new game or resuming a paused one, navigation to some other scene, showing game data such as high scores or game rules, or choosing what kind of game (mode) the user wants to play.
- Victory / Loss Conditions &mdash; Most games respond to "Game Over" or other win/lose conditions by presenting choices (scenes) to the user based on the win/lose state or when gameplay ends.
- Game Levels &mdash; A great way to engage users is to offer them the ability to progress to a new level through mastery of previous levels; each level is typically represented by its own scene (or set of scenes).

Learning how to work with scenes can really add depth and dimension to the user experience.

<!-- from Apple:
Scenes are the basic building blocks of games. Typically, you design self-contained scenes for the parts of your game, and then transition between these scenes as necessary. For example...

https://developer.apple.com/documentation/spritekit/sktransition -->


## Building Blocks
Creating new scenes or transitioning between scenes is easy if you understand the basic components SpriteKit uses to construct scenes. We've introduced some of those components already, but let's examine the core building blocks in more detail...

### View Controllers
Of course, view controllers and their lifecycle methods play a key role in bringing your scenes to life.

__*But remember:*__ In an iOS game app, the view you will be presenting is *not* the usual `UIView` that the view controller manages &mdash; it is a subclass of `SKView`, which has specific game scene behaviors built into it.

### SKScene
`SKScene` is a subclass of `SKEffectNode`, which is a subclass of `SKNode`.

As the root node in a tree of SpriteKit nodes (`SKNode`), an `SKScene` object organizes all of the active SpriteKit content, animating and rendering all of that content for display.

```Swift
class SKScene : SKEffectNode
 ```

### SKView
To display a scene, you present it from an `SKView` object.

```Swift  
class SKView : UIView
```

`SKView` is a subclass of `UIView` that renders a SpriteKit scene, but it has powerful game-based features above and beyond what `UIView` has, including that `SKView` allows you to:

1. control the timing of the view's screen updates, including pausing a scene.
2. configure toggles that have performance implications which are unique to your app.
3. display metrics in the bottom corner of the view for debugging purposes. For examples:
- `showsFPS`	&mdash; Displays a count of the current frame rate in Frames Per Second in the view.
- `showsNodeCount` &mdash; Displays a count of the current number of SKNodes being displayed in the view.
- `showsPhysics` &mdash; Displays a visual representation of the `SKPhysicsBodys` in the view.

#### presentScene()
You present a scene by calling the `presentScene(_:)` method on the scene's `SKView` object.

```Swift  
func presentScene(_ scene: SKScene?)
```
When the `presentScene(_:)` method is called, the new scene immediately replaces the current scene, if one exists.



### SKScene's Lifecycle Methods
`SKScene` comes with several functions you can override to be notified when the scene is loaded or presented, or it changes size.

Of these `SKScene` lifecycle methods, the one you will likely use the most is the `didMove(to:)` function which tells you when the scene is presented by a view.

```Swift  
func didMove(to view: SKView)
```

When you present a scene (by calling `presentScene(_:)`, for example), SpriteKit calls your scene's `didMove(to:)` method before it presents your scene in a view.

Thus, `didMove(to:)` offers you a good place to do some initial setup of your scene’s contents.

### Creating Scenes
Creating a new SpriteKit scene requires only these simple steps:

1. Create a new subclass that derives from `SKScene`
- Be sure that you import `SpriteKit`

2. Implement its desired behaviors.<sup>1</sup> This can include (but is not limited to):
- `init(size:)` &mdash; or a custom initializer
- `update(_:)`
- `didMove(to:)` and/or other `SKScene` lifecycle methods
- Functions for Touches or Movement

3. Then load and present it at the desired place in your code
- New scenes are often loaded in either a ViewController's lifecycle method or in some function in the default `GameScene` class, including its `update(_:)` or `SKScene` lifecycle methods. But where your new scene is loaded and presented depends on your app's own requirements.

> <sup>1</sup> *HINT: For ideas on methods to implement in your new scene, review any overridden methods in the default `GameScene` class that is provided as part of Xcode's SpriteKit game app template.*

**Example:** </br>
The code snippet below is of a newly-created subclass of `SKScene` called `NewScene` which has several stubbed-out functions depicting a simple, standard implementation of a new SpriteKit scene.

```Swift
import Foundation
import SpriteKit

class NewScene: SKScene {

    override init(size: CGSize) {
        // do initial configuration work here
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    override func didMove(to view: SKView) {
        // Use this method to implement any custom behavior for your scene when it is about to be presented by a view. For example, you might use this method to create the scene’s contents.
    }
}
```

...and here is a basic example of how one could instantiate and present an instance of `NewScene` in some ViewController's `viewWillAppear()`:

```Swift
override func viewWillAppear(_ animated: Bool) {
     let myNewScene = NewScene()
     myNewScene.size = self.view.bounds.size
     if let spriteView = self.view as? SKView { // cast self.view as an SKView before calling presentScene()
         spriteView.presentScene(myNewScene)
     }
 }
```

#### The `scaleMode` Property
Because your scene might appear on screens of different sizes (i.e., iPhone, iPad, etc.), it is important to determine how the scene should be sized to fit into the `SKView` for different devices.

How the `SKView` scales the scene is determined by its `scaleMode` property.

```Swift  
var scaleMode: SKSceneScaleMode { get set }
```

Under the hood, the `scaleMode` property is backed by the `SKSceneScaleMode` enum, which offers these cases:

- `.fill`
- `.aspectFill`
- `.aspectFit`
- `.resizeFill`

The default value is `SKSceneScaleMode.fill`.

> *See these links for more on the `scaleMode` property or `SKSceneScaleMode`:*
> https://developer.apple.com/documentation/spritekit/skscenescalemode
> https://developer.apple.com/documentation/spritekit/skscene/scaling_a_scene_s_content_to_fit_the_view

### Changing Scenes (Transitions)
While the simple, direct manner outlined above works fine for presenting some new scene objects, most game scenes will benefit from more dramatic transitional effects.

#### SKTransition
`SKTransition` is an object used to perform an animated transition to a new scene.

It affords you the option of using a transition to animate the change from an old scene to a new scene, which provides continuity so that the scene change is not quite so abrupt.

```Swift  
class SKTransition : NSObject
```

*Source:* https://developer.apple.com/documentation/spritekit/sktransition

**Example:** </br>
A simple example showing `scaleMode` property and a `crossFade` transition:

```Swift  
myNewScene = NewScene(size: size)
myNewScene.scaleMode = .aspectFill

let crossFade = SKTransition.crossFade(withDuration: 0.5)
view?.presentScene(myNewScene, transition: crossFade)
```

#### Creating Scenes with Custom `init()`
Another common pattern for setting up your scene is to create a custom initialization method in your new game scene class.

In the example below, we added a custom initializer that takes just one extra parameter: a `Boolean` that should be `true` if this is the first time the player played the game and `false` if it is not. We store this value in a property named `firstTime`.

```Swift  
class LoadingScene: SKScene {
  let firstTime:Bool
  init(size: CGSize, firstTime: Bool) {
    self.firstTime = firstTime
    super.init(size: size)
  }
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
```

...and we could use this Boolean flag to make conditional decisions at key points in the scene's lifecycle, such as in the `didMove(to:)`, or elsewhere, when the scene is presented:

```Swift  
override func didMove(to view: SKView) {

  if (!firstTime) {
    // If not first time, start regular game
  } else {
    // If players first time, do first time things (i.e., explain rules, offer video explaining gameplay, etc.)
  }
}
```

## In Class Activity I (30 min)



- Game mechanics (win/lose conditions)




`touchesBegan(_:with:)`



<!-- TODO: have students create a game over scene? -->


<!-- TODO:  challenge: add debugging steps to the SKView object? -->


<!-- TODO: show some generic code, with comments, on how to create a different new scene from the VC, etc. -->

<!-- TODO: show creation of Win/Loss or "GameOverScene"? (see eBook 1 for ideas)  -->





<!-- Other potential building blocks:
boolean flags...

touchesBegan() -- might be good as part of Win/Lose scene

-->

## Overview/TT II (20 min)





## In Class Activity II (optional) (30 min)

# After Class

Assignments:
1. Review:
- The "Enabling Visual Statistics for Debugging" section of [SKView - from Apple docs](https://developer.apple.com/documentation/spritekit/skview)
- [SKSceneDelegate - from Apple docs](https://developer.apple.com/documentation/spritekit/skscenedelegate)
- [Game mechanics - wikipedia](https://en.wikipedia.org/wiki/Game_mechanics)
- [Gameplay - wikipedia](https://en.wikipedia.org/wiki/Gameplay)
- [Scaling a Scene's Content to Fit the View - from Apple docs](https://developer.apple.com/documentation/spritekit/skscene/scaling_a_scene_s_content_to_fit_the_view)

<!--
TODO: Create a new scene (which?) using SpriteKit Scene Editor?
https://developer.apple.com/documentation/spritekit/skscene/creating_a_scene_from_a_file -->


<!-- possible tutorial to review ...about adding menus...
https://www.makeschool.com/academy/track/build-ios-games/clone-angry-birds-with-spritekit-and-swift-3/main-menu -->


## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. [Slides]()
1. []()
1. []()
1. []()
1. []()

https://developer.apple.com/documentation/spritekit/skview

https://developer.apple.com/documentation/spritekit/sktransition


https://developer.apple.com/documentation/spritekit/drawing_spritekit_content_in_a_view

https://developer.apple.com/documentation/spritekit/nodes_for_scene_building


https://developer.apple.com/documentation/spritekit/sktransition

https://developer.apple.com/documentation/spritekit/sktransition/transitioning_between_two_scenes


https://developer.apple.com/documentation/spritekit/skscene/1519607-didmove

[Kerbal Space Program - wikipedia](https://en.wikipedia.org/wiki/Kerbal_Space_Program)

https://en.wikipedia.org/wiki/Asteroids_(video_game)

[Game studies - wikipedia](https://en.wikipedia.org/wiki/Game_studies)

[Asteroids (video game) - wikipedia](https://en.wikipedia.org/wiki/Asteroids_(video_game))

https://developer.apple.com/documentation/spritekit/skscene/1519562-scalemode


https://infinitecortex.com/2014/01/spritekit-understanding-skscene-scalemode/
