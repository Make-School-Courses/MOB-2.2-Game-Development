# Working With Scenes & Adding "Juice"

<!-- INSTRUCTOR NOTES:
1) For Initial Exercise:
- there are some ideas below the exercise that could guide or prompt discourse, in the event students do not proffer topic discussion on their own

-->


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

<!-- TODO:  Describe "Juice" here -- it is an umbrella under which all topics in the outline for this lesson fit properly -->

<!-- TODO: search ref books 1 and 2 for ideas on how to describe, exemplify "juice" -->


<!-- TODO: list the types of Juice -- see Ref books for ideas:

- sound Effects
- scenes
- game mechanics, including Victory or Game Over Conditions
- Partical Physics
- screen Effects


...and these leads directly into the Learning Objectives...

 -->



<!-- TODO:  Describe why you need to Work with Games and add "Juice"... -->

<!-- to really engage your users and hold their interest...add:

to really add depth and dimension to the user experience.

But to really entertain and delight your users &mdash; to get users to engage with your game...

- Scenes
- "Juice" -->

## Learning Objectives (5 min)

1. Identify and describe
1. Define
1. Design
1. Implement:

<!-- - iOS’s built-in support for playing both sound effects and background music -->


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



## Initial Exercise (20 min)

### As A Class

Discuss these topics related to **Game Mechanics ...**

**Topic 1:** From your assignment at the end of last class, what key game mechanisms <sup>1</sup> stood out most prominently in your mind when you read Wikipedia's definition of the term, "Game mechanics"?

**Topic 2:** Think about the current state of your AstroJunk game....

**Q:** What game mechanisms are the most obviously missing from AstroJunk so far?

**Q:** What game mechanics would you add to AstroJunk first? (i.e., what would add the most value to the game? Does the order that you develop game mechanisms matter?)

[Optional] Diagram the UI flow of the top 1 or 2 game mechanisms identified by the class as the first to implement.

 > <sup>1</sup> [Game mechanics - wikipedia](https://en.wikipedia.org/wiki/Game_mechanics)

<!-- INSTRUCTOR NOTES:
- the idea is to review Game Mechanics, and to get students thinking about what is missing from AstroJunk at this point, as a lead in to TT1 and later in-class activities
- some of the most obviously missing mechanisms now:
- a way to rack up points for either (a) asteroid or bomb hits (b) debris that has slipped by the ship (could add up to negative points), and/or (c) positive points accrued when the ship collects debris
...all of these are prerequisites to developing a GameOver scene and/or its Win/Loss conditions.
- Victory conditions (Loss avoidance, Victory points, Combination conditions, etc. <sup>1</sup>) - as mentioned above, this is missing, but Win/Loss is also dependent on some sort of score accrual (i.e., Victory points and/or Loss avoidance)...
- game Levels
- also, what "juice" can b added? Sound effects? explosions on collision? other?
-->


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

2. Implement its desired behaviors.<sup>2</sup> This can include (but is not limited to):
- `init(size:)` &mdash; or a custom initializer
- `update(_:)`
- `didMove(to:)` and/or other `SKScene` lifecycle methods
- Functions for Touches or Movement

3. Then load and present it at the desired place in your code
- New scenes are often loaded in either a ViewController's lifecycle method or in some function in the default `GameScene` class, including its `update(_:)` or `SKScene` lifecycle methods. But where your new scene is loaded and presented depends on your app's own requirements.

> <sup>2</sup> *HINT: For ideas on methods to implement in your new scene, review any overridden methods in the default `GameScene` class that is provided as part of Xcode's SpriteKit game app template.*

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

In the example below, we added a custom initializer that takes just one extra parameter: a Boolean that should be `true` if this is the first time the player played the game and `false` if it is not. We store this value in a property named `firstTime`.

```Swift  
class GameLoadingScene: SKScene {
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

Let's start __*adding game mechanics*__<sup>1</sup> to AstroJunk...

### As Individuals
So far, AstroJunk has no mechanism for Win/Loss (aka, Victory) conditions.

Applying what you've learned so far about working with SpriteKit scenes &mdash; and using ideas from the class discussion in today's initial exercise &mdash; you are to begin adding the first piece of a Win/Loss condition to your AstroJunk game.

**Output:**
The output or final product at the end of this in-class exercise will only be a new scene called "Game Over" that you will present when the user achieves either a Win or Loss state. Once the your new scene is presented, tapping anywhere on its screen/view should restart the game.

How the Win / Loss states are achieved will ultimately be up to you (and you will create these Victory Conditions as an After Class assignment later.)

But, for now, you only need to create a simple Boolean condition that will be used to invoke the presentation of your "Game Over" scene, present the scene, and restart the game when the new scene's view is touched.

**TODO:**
1. Create a new subclass of `SKScene` called `GameOverScene`

2. In your `GameScene` class, you will need a counter that will be incremented any time the spaceship captures a piece of space debris

- When this flag increments to 3, invoke your new `GameOverScene`

3. In your new `GameOverScene` class, you will need to implement:

- a Boolean flag named `won` representing whether the player has won the most recent game play or not

- a `didMove(to:)` function with a conditional statement that shows a label stating "You Won!" when the `won` flag is true, or "You lose...", when the `won` flag is false

- some function which will restart the game when the user taps the screen of the `GameOverScene`

<!-- INSTRUCTOR NOTE: The `touchesBegan(_:with:)` function might be the best place for this (but not the only appropriate function) -->

<!--
INSTRUCTOR NOTE - here is what the new GameOverScene could look like:

class GameOverScene: SKScene {
  let won:Bool
  private var stateLabel : SKLabelNode?

  init(size: CGSize, won: Bool) {
    self.won = won
    super.init(size: size)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

override func didMove(to view: SKView) {
  var background: SKSpriteNode
  if (won) {
    stateLabel.text = "You Win"
  } else {
    stateLabel.text = "You Lose"
  }
  background.position =
    CGPoint(x: size.width/2, y: size.height/2)
  self.addChild(background)
  // More here...
} -->



<!-- TODO: create and add graphics to show the Win and Loss graphics for the GameOverScene-->


<!-- TODO:  challenge: add debugging steps to the SKView object? -->



## Sound [Overview/TT II]  (20 min)
> George Lucas, the creator of the *Star Wars* movies, once famously said: "The sound and music are 50% of the entertainment in a movie." <sup>3</br>

Sound is just as important in game apps.

When a game includes awesome sound effects that respond to visible gameplay elements and great-sounding background music, players become immersed in the game's world.

### Sound in SpriteKit apps
<!-- Thank goodness the good folks at Apple realize the importance of sound! They added some really cool sound capabilities into SceneKit. -->

iOS supports two built-in functional mechanisms in SpriteKit for including sound effects and music in your game:

1. `AVAudioPlayer` - Part of the `AVFoundation` framework. It's an audio player that provides playback of audio data from a file or memory. You'll want to use `AVAudioPlayer` for playing long-running background music.

2. `SKAudioNode` &mdash; A subclass of `SKNode` that plays audio. `SKAudioNode` allows you to create sound *actions* &mdash; subclasses of `SKAction` that you can use to control your sound effects which can be implemented like any other `SKAction` (including participation in group or sequence actions).




<!-- TODO:  Describe "Juice" more fully... -->


### Adding Background Music

<!-- TODO:  show basic steps  -- and key points about -- to implement sound file for bg music, using code snippets, and end by showing how to play, loop, etc. - reference Ref Ebook 2 for details...Ref ebook 1 for other clues -->



<!-- Main points:

- see ref books for ideas and coverage

***
- use `AVAudioPlayer` for playing long-running background music.

- loading files early to avoid delays in sound -- but measuring this against memory used up if you have lots of these long-running files

-  
 -->


 <!-- TODO:  discuss Asset Catalog with sound folder? or is that too much?

 - same with adding a utility class for  handling AVAudioPlayer and BG sounds? -->


 <!-- You create an AVAudioPlayer by providing it with the location of the file you want it to play. This should generally be done ahead of time, before the sound needs to be played, to avoid playback delays. -->


**Illustrating Example**

Here is an example of xxxx showing xxx from above...


Assumptions;
imported `AVFoundation` framework
non-working


<!-- Show code, with numbers explaining key lines ... -->


```Swift  
import AVFoundation // 1)

public var backgroundMusicPlayer: AVAudioPlayer? // 2)

public func playBackgroundMusic(_ filename: String) {
    let url = Bundle.main.url(forResource: filename, withExtension: nil) // 3)
    if (url == nil) {
      print("Could not find file: \(filename)")
      return
    }

    var error: NSError? = nil
    do {
      backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url!) // 4)
    } catch let error1 as NSError {
      error = error1
      backgroundMusicPlayer = nil
    }
    if let player = backgroundMusicPlayer {
      player.numberOfLoops = -1 // 5)
      player.prepareToPlay() // 6)
      player.play() // 7)
    } else {
      print("Could not create audio player: \(error!)")
    }
  }

  // any place in your code you want to play the BG music...
  playBackgroundMusic("backgroundMusic.wav") // 8)

  // ...at some point, you want to stop playing...
  backgroundMusicPlayer.stop() // 9)
```

Let's breakdown the key events in this code snippet:

1) For access to the `AVAudioPlayer`, we imported the `AVFoundation` framework

2) Here, we simply create an instance variable that is of type `Optional: AVAudioPlayer` for later use

3) We want to pass the location (as a URL) of whatever file we want to play to the `AVAudioPlayer` variable:

- And to get the location of the file, we use the `Bundle` class’s `url(forResource:, withExtension:)` function because it allows us to access the location of __*any*__ resource that has been added to the app’s Xcode target

4) Here, we pass the location of the file to play to the `AVAudioPlayer` instance, handling any of the typical file I/O errors that can occur

5) To loop playback, you change the `numberOfLoops`<sup>4</sup> property on your `AVAudioPlayer` instance:

By setting the `numberOfLoops` property, you can make an `AVAudioPlayer` play its file a single time or a fixed number of times before stopping. Or you can set it to run continuously until it is sent a `pause` or a `stop` message.

- To make an `AVAudioPlayer` play one time and then stop:

```Swift  
audioPlayer?.numberOfLoops = 0
```

> *This behavior is the same as the default behavior `AVAudioPlayer` &mdash; unless you configure it otherwise, `AVAudioPlayer` by default plays its sound only one time, stops the player, and unloads the player object from memory.*

- Setting the `numberOfLoops` property to `1` will make `AVAudioPlayer` play twice, then stop:

```Swift  
audioPlayer?.numberOfLoops = 1
```

After it’s finished playing, a second call to `play()` will rewind it and play it again.

6) Calling the `prepareToPlay()` method on the player object minimizes the lag between calling the `play()` method and the start of sound output by preparing the audio player's hardware and memory buffers required for playback.

> *Note that if the audio player is not already prepared for playback, the `prepareToPlay()` method will be called implicitly by the `play()` method when it is called, but this will likely result in the sound lag mentioned.*

7) Calling `play()` on the player will asynchronously play the sound file passed to the player

8) At the desired point(s) in your code, call the `playBackgroundMusic()` function, passing in the audio file you want to play

9) At key points in your game &mdash; when your Game Over Scene is presented, for example &mdash; you'll to stop playback:

- To stop playback, you use the `pause()` or `stop()` functions <sup>4</sup>




888

### Adding Sound Effects

 <!-- Typically music and large audio files should be streamed, but for small sound effects, it’s better to preload them into memory for faster playback. -->

<!-- where are the sound effects? One of the biggest mistakes a game developer can make is to underestimate the power of audio. -->

<!-- TODO: see Game State Management section in ref book on 3D games for ideas on when you would add sound to act as Game State cues  -->

<!-- TODO: firt, tie sound effects to events, including Game State, but also collisions, etc. -->


<!-- TODO: Ending: "As you develop your game, you will add Juice to it as you go..." -->


Sound Actions...

SKAction.playSoundFileNamed("pop.mp3",
   waitForCompletion: false),

<!--

    preloading into memory...reusing effects...
 -->


## In Class Activity II (optional) (30 min)

# After Class

Assignments:

1. **Challenge** &mdash; Add the following to your AstroJunk game's Game Over scene:
- A __*menu*__ that, on winning the game, offers the user the option of choosing:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a) "Replay" or "Restart" &mdash; which replays the previous level of game just played
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b) "Next Level" &mdash; which offers the user a new level of the game to play (this means you will have to create at least one additional level)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c) "High Scores" &mdash; presenting the user with a list of highest scores so far.
<!-- TODO: get URLS to illustrate adding menus, etc -->


<!-- Often, it’s best to start a game with an opening or main menu scene, rather than throw the player right into the action. The main menu often includes options to start a new game, continue a game, access game options and so on. -->


2. Review:
- The "Enabling Visual Statistics for Debugging" section of [SKView - from Apple docs](https://developer.apple.com/documentation/spritekit/skview)
- [SKSceneDelegate - from Apple docs](https://developer.apple.com/documentation/spritekit/skscenedelegate)
- [Gameplay - wikipedia](https://en.wikipedia.org/wiki/Gameplay)
- [Scaling a Scene's Content to Fit the View - from Apple docs](https://developer.apple.com/documentation/spritekit/skscene/scaling_a_scene_s_content_to_fit_the_view)
- The "Conrolling the Audio of a Node" section of the [Action Initializers - Apple docs](https://developer.apple.com/documentation/spritekit/skaction/action_initializers)
- Functions and properties in the "Configuring and Controlling Playback" and "Managing Information About a Sound" sections of the [AVAudioPlayer - Apple docs](https://developer.apple.com/documentation/avfoundation/avaudioplayer) <sup>4</sup> especially how to:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - stop
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - pause
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rewind



<!-- < look up other AVAudioPlayer functions -- see Apple docs for list:
To rewind an audio player, you change the currentTime property.

To rewind an audio player, you change the currentTime property.

To rewind an audio player, you change the currentTime property. -->



https://developer.apple.com/documentation/spritekit/skaudionode






<!--
TODO: Create a new scene (which?) using SpriteKit Scene Editor?
https://developer.apple.com/documentation/spritekit/skscene/creating_a_scene_from_a_file -->


<!-- possible tutorial to review ...about adding menus...
https://www.makeschool.com/academy/track/build-ios-games/clone-angry-birds-with-spritekit-and-swift-3/main-menu -->


## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges




<!-- Resume: AstroJunk -- add Win / Loss conditions, such as Victory points for capturing debris, or Loss avoidance (negative points for getting hit by bombs/asteroids, or letting debris pass)
- present GameOverScene, with requisite graphic and sound effects for either (a) Win conditions or (b) Loss conditions...
- will require adding graphics

Q: Add a menu to allow player to (1) Start Over (2) Go to next level? ...or other?
-->



## Additional Resources

1. [Slides]()
2. <sup>1</sup> [Game mechanics - wikipedia](https://en.wikipedia.org/wiki/Game_mechanics)
3. [](https://developer.apple.com/documentation/spritekit/skview)
4. [](https://developer.apple.com/documentation/spritekit/sktransition)
5. [](https://developer.apple.com/documentation/spritekit/drawing_spritekit_content_in_a_view)
6. [](https://developer.apple.com/documentation/spritekit/nodes_for_scene_building)
7. [](https://developer.apple.com/documentation/spritekit/skscene/1519562-scalemode)
8. [](https://infinitecortex.com/2014/01/spritekit-understanding-skscene-scalemode/)
9. [](https://developer.apple.com/documentation/spritekit/skscene/1519607-didmove)
10. [](https://developer.apple.com/documentation/spritekit/sktransition/transitioning_between_two_scenes)
11. <sup>3</br> [George Lucas Quote](https://quotefancy.com/quote/1021372/George-Lucas-The-sound-and-music-are-50-of-the-entertainment-in-a-movie)
12. [Kerbal Space Program - wikipedia](https://en.wikipedia.org/wiki/Kerbal_Space_Program)
13. [Game studies - wikipedia](https://en.wikipedia.org/wiki/Game_studies)
14. [Asteroids (video game) - wikipedia](https://en.wikipedia.org/wiki/Asteroids_(video_game))


1. [](https://en.wikipedia.org/wiki/AVFoundation)
1. [](https://developer.apple.com/av-foundation/)
1. [](https://developer.apple.com/documentation/avfoundation)

1. [](https://developer.apple.com/documentation/avfoundation/audio_track_engineering)
1. [](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/00_Introduction.html)
1. [](https://www.hackingwithswift.com/read/36/6/background-music-with-skaudionode-an-intro-plus-game-over)

1. [](https://developer.apple.com/documentation/spritekit/skaction/1417664-playsoundfilenamed)

1. []()

1. []()
