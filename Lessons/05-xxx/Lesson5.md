# [TITLE]

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


## Why you should know this or industry application (5 min)
The key to making a popular game app is polish: adding loads of well-considered details that set your game apart and bring it to life.

To push your game to that next level &mdash; to really entertain and delight your users, to get them to engage with your game &mdash; you absolutely *must* add what is known as __*"juice."*__

Adding juice means tricking out your game with special effects such as:

- Scenes and Scene Transitions
- Simple Animation (scaling, rotation, movement, and more)
- Music and Sound Effects
- Game Mechanics (including Victory or Game Over Conditions)
- Particle Effects (explosions, collisions, fire, etc.)
- Screen Effects

When every interaction within your game world results in a cascade of visual and audible feedback really adds depth and dimension to the user experience and keeps users coming back for more.

As you develop your game, you will get in the habit of adding juice to it as you go...

> Most of the tools to create the special effects listed above are already in your iOS toolkit; others, such as music and sound effects, can be found online or created with free or inexpensive software


<!-- TODO:  Describe "Juice" here -- it is an umbrella under which all topics in the outline for this lesson fit properly -->

<!-- TODO: search ref books 1 and 2 for ideas on how to describe, exemplify "juice" -->



## Learning Objectives (5 min)

- iOS’s three built-in support mechanisms for playing both sound effects and background music, and how to use them to create sound FX in a game
- how to work with SpriteKit Particle Effects to create special effects

2. Implement in your running class project, AstroJunk:
- Background music
- Sound effects, in response to game events/mechanics
- SpriteKit Particle Systems to add explosions/fire in response to game entity events (collisions, etc.)

## Initial Exercise (20 min)

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




## Sound &mdash; [Overview/TT II]  (20 min)
> George Lucas, the creator of the *Star Wars* movies, once famously said: "The sound and music are 50% of the entertainment in a movie." <sup>3</br>

It's just as important in game apps.

One of the biggest mistakes a game developer can make is to underestimate the power of audio.

When a game includes awesome sound effects that respond to visible gameplay elements and great-sounding background music, players become immersed in the game's world.

### Sound in SpriteKit apps
Thankfully, the good folks at Apple realize the importance of sound! They've included some really flexible, really cool sound capabilities in SpriteKit...

iOS supports three built-in functional mechanisms in SpriteKit for including sound effects and music in your game:

1. `AVAudioPlayer` &mdash; Part of the `AVFoundation` framework. It's an audio player that provides playback of audio data from a file or from memory.
- Gives you the most power and control over audio playback.
- Requires the most work to implement.

2. `SKAction` &mdash; Allows you to create sound *actions* &mdash; subclasses of `SKAction` that you can use to control your sound effects which can be implemented like any other `SKAction` (including participation in group or sequence actions).

- Best for short, one-time audio clips (not as good for background music or other long-playing sound files)
- Audio actions are instantaneous, which makes them more useful when chaining or reusing `SKAction` objects.

3. `SKAudioNode` &mdash; A subclass of `SKNode` that plays audio.
- Good for background music or other audio for which you might want to control stop and start.
- Can also be used for Sound FX.
- Because it is a subclass of `SKNode`, you can also manipulate it by passing `SKAction` objects to it.
- Affords more power and control than `SKAction`, but has fewer controlling functions than `AVAudioPlayer`.

*Sources: Various Apple Docs*

### Adding Background Music
Music plays an important part in setting the pace and emotional tone of a movie.

In game apps, background music servers a similar purpose.

And adding background music to your game is easy.

But there are important considerations you should be aware of.

**Considerations** </br>
Here are a few key points to consider when adding background music:

1. **For long-running files** &mdash; Use `AVAudioPlayer` for playing long-running files such as background music.

2. **Prevent Sound Delays**

- load files ahead of time, before the sound needs to be played, to avoid playback delays (but weigh this against memory consumption: lots of long-running sound files can eat up memory)

> *Typically music and large audio files should be streamed, if possible. For small sound effects, it’s better to preload them into memory for faster playback.*

3. **Create utility classes** &mdash; for handling audio, including `AVAudioPlayer` functions, loading sound files, and so on

4. **Use Asset Catalogs** &mdash; To organize audio files, create a sound folder inside an Asset Catalog and store files there for loading


<!-- TODO: add more key points..

- see ref books for ideas and coverage  
-->

**Two Implementation Options** </br>
1. `AVAudioPlayer` provides more power and control.
2. `SKAudioNode` is easier to implement

__*AVAudioPlayer Example*__ </br>
This simple, non-working code snippet illustrates the key steps needed to add background music to a game app by implementing an instance of `AVAudioPlayer`:

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

- To get the location of the file, we use the `Bundle` class’s `url(forResource:, withExtension:)` function because it allows us to access the location of __*any*__ resource that has been added to the app’s Xcode target

4) Here, we pass the location of the file to play to the `AVAudioPlayer` instance, handling any of the typical file I/O errors that are commonly-known to occur

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

__*SKAudioNode Example*__ </br>
The simplest way to add audio to a SpriteKit scene is to add a child `SKAudioNode` to it.

`SKAudioNode` was introduced in iOS 9 as an alternative to `SKAction.playSoundFileNamed(...)`.

`SKAudioNode` is much more powerful than its alternative:
- Sounds are played automatically using `AVFoundation`.
- Can be added as a child to a SpriteKit `SKNode`.
- The node can optionally add 3D spatial audio effects to the audio when it is played (3D audio mixing is added automatically if the attribute `isPositional` is set to `true`), which allows you to pan your audio left and right.
- It loops its audio file by default.
- It allows stopping and restarting audio whenever you want.

```Swift  
let audioNode = SKAudioNode(fileNamed: "drums.mp3")
spriteKitViewController.scene.addChild(audioNode)
audioNode.isPositional = false // 1)
audioNode.run(SKAction.stop()) // 2)
audioNode.run(SKAction.play()) // 3)
```

Let's examine what's happening in the code above:

1) `isPositional` is a Boolean property that indicates whether the node’s audio is altered based on the position of the node.

- The default value is `true`, the audio mixer considers the position and velocity of the `SKAudioNode` relative to scene's current listener<sup>5</sup> node. This means the audio is attached to the node and, if the node moves, the audio moves with it.

- If `false`, then the sound is played normally.

2) Pass an `SKAction` to the node to stop audio playback.

3) Restart audio playback.

*Sources:* </br>
- https://developer.apple.com/documentation/spritekit/skscene/using_audio_nodes_with_the_scene_s_listener
- https://tutorials.tinyappco.com/SwiftGames/Sound


### Adding Sound FX
Adding sounds effects that play at just the right moments is another great way to add "juice" to your game, as they can also significantly enhance user immersion in your game's world.

One of the best initial strategies for adding sound to your game is to tie effects to game events. Examples:

1. **Game State events** &mdash; which can include:
- Game start
- Game over (Win/Lose conditions)
- New game level achieved
- Game progress is paused
- Game reload from a saved state

2. **Player events** &mdash; such as:
- Collisions
- Points scored
- Loot, powers or weapons acquired


<!-- TODO: 888 see Game State Management section in ref book on 3D games for ideas on when you would add sound to act as Game State cues  -->


**Simple Example** </br>
Listed below are several sound actions created with `SKAction.playSoundFileNamed(...)` that one might set as constants in a utility file or in a project's `GameScene` file:

```Swift
let soundGameStart = SKAction.playSoundFileNamed("gameStart.wav", waitForCompletion: true)
let soundCoinDrop = SKAction.playSoundFileNamed("coinDrop.wav", waitForCompletion: true)
let soundPointScored = SKAction.playSoundFileNamed("pointScored.wav", waitForCompletion: true)
let wallCollisionSound: SKAction = SKAction.playSoundFileNamed("hitWall.wav", waitForCompletion: false)
let soundGameOver = SKAction.playSoundFileNamed("player_die.wav", waitForCompletion: false)
let soundWin = SKAction.playSoundFileNamed("winning.wav", waitForCompletion: false)
```

- Each sound action will load and play an audio file.
- Because they were defined before they were needed, they will be preloaded into memory &mdash; which prevents the game from stalling when you play any of them for the first time. (Typically music and large audio files should be streamed, but for small sound effects, it’s better to preload them into memory for faster playback.
)

To play them, pass them to a `run()` function, just as you did with any `SKAction` in previous lessons:

```Swift  
run(wallCollisionSound)
```

**Sequence Example** </br>
One of the cool things about sound actions created using `SKAction.playSoundFileNamed(...)` is that you can associate them with a set of actions &mdash; perhaps a set of actions that all occur at the time of some game event &mdash; and include them in group or sequence actions.

Expanding on the set of actions declared in the example above (and assuming that `action1` and `action2` are `SKActions` declared somewhere else), we could include a sound action as one of the actions that are executed together as part of a sequence:

```Swift
let sequenceWallCollisionAction = SKAction.sequence([action1, action2, wallCollisionSound])
```

**Random Selection Example** </br>
To add variety to your game's world, `SKAction.playSoundFileNamed(...)` also let's you set up an array of similar effects from which your code can randomly choose a sound file to play:

```Swift  
let soundCarCrashesArray = [
  SKAction.playSoundFileNamed("carCrash1.wav", waitForCompletion: false),
  SKAction.playSoundFileNamed("carCrash2.wav", waitForCompletion: false),
  SKAction.playSoundFileNamed("carCrash3.wav", waitForCompletion: false)
]
```

Then, depending on game conditions, you could choose which of the similar effects to run:

```Swift  
 run(soundCarCrashesArray[2])
```

> __*TIP:*__ *As you can imagine, you might also randomize the index of the array, which could allow your game to appear lively by choosing similar sounds, at random, for the same or similar game events.*


## In Class Activity II (30 min)

Let's add audio to AstroJunk...

### As Individuals
Using the audio files you gathered in the previous lesson:

- Add background music to be played while the game runs. Make the music stop at Game Over and any other appropriate game states
- Add sound FX to appropriate game events (collisions, points scored, etc.)

## Particle emitter

Adding particle systems to your games is an effective way to add special effects. With particle systems you can simulate: water, smoke, fire, snow, stars, sparks, rain, bubbles, explosions, and much more.

How the effect is created is by using a small image texture and a configuration file.

![particle1](assets/particle1.png) ![particle2](assets/particle2.png)
*Source: 2D Apple Games by Tutorials*

SpriteKit makes it easy to create and use particle systems by giving you a special node nam [ed `SKEmitterNode`, its purpose is to make particle systems and render them as quickly as possible.
You can create particles programmatically or with the particle editor. The second one is helpful to use since you can make changes to the values making up the particle and see the results being animated.

To do this, you simply create a new file with the iOS/Resource/SpriteKit Particle File template. This will create an .sks file that can be modified with the editor.

Once in code you’ll only need to instantiate the particles with the file and a position. Then add the particle emitter as child in the scene.

```Swift
let fireEmitter = SKEmitterNode(fileNamed: "Fire.sks")!
fireEmitter.position = CGPoint(x: 200, y: 200)
addChild(fireEmitter)

```

You can check what all the properties do [here](particleProperties.md).

## Activity

Create an .sks file for a new particle emitter. You want to add fire to the spaceship as it flies. Play around with all the values of the particle emitter until you’re happy with the result.

This is an example of how it might turn out like:

![particle2](assets/fire.gif)

<!-- Resume: AstroJunk -- add Win / Loss conditions, such as Victory points for capturing debris, or Loss avoidance (negative points for getting hit by bombs/asteroids, or letting debris pass)
- present GameOverScene, with requisite graphic and sound effects for either (a) Win conditions or (b) Loss conditions...
- will require adding graphics

Q: Add a menu to allow player to (1) Start Over (2) Go to next level? ...or other?
-->


# After Class

Assignments:
1. Review:
-


## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

- The "Conrolling the Audio of a Node" section of the [Action Initializers - Apple docs](https://developer.apple.com/documentation/spritekit/skaction/action_initializers)
- Functions and properties in the "Configuring and Controlling Playback" and "Managing Information About a Sound" sections of the [AVAudioPlayer - Apple docs](https://developer.apple.com/documentation/avfoundation/avaudioplayer) <sup>4</sup> especially how to:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - stop
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - pause
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rewind

<!-- < look up other AVAudioPlayer functions -- see Apple docs for list:
To rewind an audio player, you change the currentTime property.

To rewind an audio player, you change the currentTime property.

To rewind an audio player, you change the currentTime property. -->

15. [AVFoundation - wikipedia](https://en.wikipedia.org/wiki/AVFoundation)
16. [AVFoundation - Apple Docs](https://developer.apple.com/av-foundation/)
17. [AVFoundation - Apple Docs](https://developer.apple.com/documentation/avfoundation)
18. [Audio Track Engineering - Apple Docs](https://developer.apple.com/documentation/avfoundation/audio_track_engineering)
19. [About AVFoundation - Apple Docs](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/00_Introduction.html)
20. [SKAudioNode - Apple Docs](https://developer.apple.com/documentation/spritekit/skaudionode)
21. [Background music with SKAudioNode, an intro, plus game over - an article](https://www.hackingwithswift.com/read/36/6/background-music-with-skaudionode-an-intro-plus-game-over)
22. [`playSoundFileNamed(_:waitForCompletion:)` - Apple Docs](https://developer.apple.com/documentation/spritekit/skaction/1417664-playsoundfilenamed)
23. [`listener` (property) - Apple docs](https://developer.apple.com/documentation/spritekit/skscene/1520363-listener)
