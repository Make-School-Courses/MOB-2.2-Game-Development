
<!-- .slide: class="header" -->

# Juice

## [Slides](https://make-school-courses.github.io/MOB-2.2-Game-Development/Slides/05-Juice/Lesson5.html ':ignore')

<!-- > -->

## Agenda

- Class project progress check-in
- Adding juice 🧃
- Particles in SpriteKit
- Adding juice to out project

<!-- > -->

## Learning Objectives

- Define game feel or juice
- Work with SpriteKit's Particle Effects to create special effects
- Implement in your running class project:
  - Background music
  - Sound effects, in response to game events/mechanics
  - SpriteKit Particle Systems to add explosions/fire in response to game entity events (collisions, etc.)

<!-- > -->

## Adding juice

The key to making a popular game app is polish: adding loads of well-considered details that set your game apart and bring it to life.

To push your game to that next level &mdash; to really entertain and delight your users, to get them to engage with your game &mdash; you absolutely *must* add what is known as "juice."

<!-- v -->

Adding juice means tricking out your game with special effects such as:

- Scenes and Scene Transitions
- Simple Animation (scaling, rotation, movement, and more)
- **Music and Sound Effects**
- Game Mechanics (including Victory or Game Over Conditions)
- **Particle Effects (explosions, collisions, fire, etc.)**

<!-- v -->

When every interaction within your game world results in a cascade of visual and audible feedback really adds depth and dimension to the user experience and keeps users coming back for more.

As you develop your game, you will get in the habit of adding juice to it as you go...

<!-- v -->

### But what is it really?

"Juicing is about taking a game that works and adding **layers of satisfaction to improve game feel**. Satisfaction is created by the senses, every **visual** and **auditory** input has the ability to make something that is virtual work in a way that is more believable."

<iframe src="https://www.youtube.com/embed/216_5nu4aVQ" data-autoplay  width="500" height="300" ></iframe>

<!-- v -->

We rely in animations and audio to add juice to our games.

https://the12principles.tumblr.com

Animations when done right will inject a sense of movement and reality to our games. It makes them look alive and real. This is what makes them more enjoyable.

<!-- v -->

Game juice should always be added to support your core gameplay. This means we can't add effects at random, but they should be very well thought out.

A good way to think about it is: **what do we want the user to feel?**

<aside class="notes">
For example in a story telling game, or in a horror game, we would want sounds and animations that lead to mystery and suspense. Whereas in an action game, we would want more joyful or bouncy animations.
</aside>

<!-- v -->

### Juicy effects

How we choose to add juice will depend on the game. But here are some common examples:
- An effect when a collision happens
- Dust when an character lands a big jump
- Sparkles after a collision
- Small pauses
- Adding a trail to reinforce movement
- Animating scale and rotation

<!-- > -->

## Mini Demo

Live gameplay of "Smove"

Live gameplay of "Stack"

Notice the elements that add juice to the game. How many can you see?

<!-- From outline reworked on 8/6/19:

Class 4: Adding “Juice” & Working With Scenes

TV - Background music
TV - Sound action
AG Particle systems (SpriteKit)
	Activity:
Add explosions? Collisions? Between meteors and the ship
Fire to the ship as it flies
Debugging and/or testing

-->

<!-- > -->

## Sound

> George Lucas, the creator of the *Star Wars* movies, once famously said: "The sound and music are 50% of the entertainment in a movie."

It's just as important in game apps.

One of the biggest mistakes a game developer can make is to underestimate the power of audio.

When a game includes awesome sound effects that respond to visible gameplay elements and great-sounding background music, players become immersed in the game's world.

<!-- v -->

### Sound in SpriteKit apps

Thankfully, the good folks at Apple realize the importance of sound! They've included some really flexible, really cool sound capabilities in SpriteKit...

iOS supports three built-in functional mechanisms in SpriteKit for including sound effects and music in your game:

1. `AVAudioPlayer` &mdash; Part of the `AVFoundation` framework. It's an audio player that provides playback of audio data from a file or from memory.
- Gives you the most power and control over audio playback.
- Requires the most work to implement.

<!-- v -->

2. `SKAction` &mdash; Allows you to create sound *actions* &mdash; subclasses of `SKAction` that you can use to control your sound effects which can be implemented like any other `SKAction` (including participation in group or sequence actions).

- Best for short, one-time audio clips (not as good for background music or other long-playing sound files)
- Audio actions are instantaneous, which makes them more useful when chaining or reusing `SKAction` objects.

<!-- v -->

3. `SKAudioNode` &mdash; A subclass of `SKNode` that plays audio.
- Good for background music or other audio for which you might want to control stop and start.
- Can also be used for Sound FX.
- Because it is a subclass of `SKNode`, you can also manipulate it by passing `SKAction` objects to it.
- Affords more power and control than `SKAction`, but has fewer controlling functions than `AVAudioPlayer`.

*Sources: Various Apple Docs*

<!-- > -->

### Adding Background Music
Music plays an important part in setting the pace and emotional tone of a movie.

In game apps, background music servers a similar purpose.And adding background music to your game is easy. But there are important considerations you should be aware of.

**Considerations** </br>

1. **For long-running files** &mdash; Use `AVAudioPlayer` for playing long-running files such as background music.

<!-- v -->

2. **Prevent Sound Delays**

- load files ahead of time, before the sound needs to be played, to avoid playback delays (but weigh this against memory consumption: lots of long-running sound files can eat up memory)

*Typically music and large audio files should be streamed, if possible. For small sound effects, it’s better to preload them into memory for faster playback.*

<!-- v -->

3. **Create utility classes** &mdash; for handling audio, including `AVAudioPlayer` functions, loading sound files, and so on

4. **Use Asset Catalogs** &mdash; To organize audio files, create a sound folder inside an Asset Catalog and store files there for loading


<!-- v -->

**Two Implementation Options** </br>
1. `AVAudioPlayer` provides more power and control.
2. `SKAudioNode` is easier to implement

[Link to example implementations in repo]()

<!-- > -->

## Adding Sound FX
Adding sounds effects that play at just the right moments is another great way to add "juice" to your game, as they can also significantly enhance user immersion in your game's world.

<!-- v -->

One of the best initial strategies for adding sound to your game is to tie effects to game events. Examples:

1. **Game State events** &mdash; which can include:
- Game start
- Game over (Win/Lose conditions)
- New game level achieved
- Game progress is paused
- Game reload from a saved state

<!-- v -->

2. **Player events** &mdash; such as:
- Collisions
- Points scored
- Loot, powers or weapons acquired

<!-- > -->

**Simple Example** </br>
Listed below are several sound actions created with `SKAction.playSoundFileNamed(...)` that one might set as constants in a utility file or in a project's `GameScene` file:

```swift
let soundGameStart = SKAction.playSoundFileNamed("gameStart.wav", waitForCompletion: true)
let soundCoinDrop = SKAction.playSoundFileNamed("coinDrop.wav", waitForCompletion: true)
let soundPointScored = SKAction.playSoundFileNamed("pointScored.wav", waitForCompletion: true)
let wallCollisionSound: SKAction = SKAction.playSoundFileNamed("hitWall.wav", waitForCompletion: false)
let soundGameOver = SKAction.playSoundFileNamed("player_die.wav", waitForCompletion: false)
let soundWin = SKAction.playSoundFileNamed("winning.wav", waitForCompletion: false)
```

To play them, pass them to a `run()` function, just as you did with any `SKAction` in previous lessons:

```swift  
run(wallCollisionSound)
```

<aside class="notes">
Each sound action will load and play an audio file.

Because they were defined before they were needed, they will be preloaded into memorywhich prevents the game from stalling when you play any of them for the first time. (Typically music and large audio files should be streamed, but for small sound effects, it’s better to preload them into memory for faster playback.)
</aside>

<!-- > -->

**Sequence Example** </br>
One of the cool things about sound actions created using `SKAction.playSoundFileNamed(...)` is that you can associate them with a set of actions &mdash; perhaps a set of actions that all occur at the time of some game event &mdash; and include them in group or sequence actions.

Expanding on the set of actions declared in the example above (and assuming that `action1` and `action2` are `SKActions` declared somewhere else), we could include a sound action as one of the actions that are executed together as part of a sequence:

```Swift
let sequenceWallCollisionAction = SKAction.sequence([action1, action2, wallCollisionSound])
```

<!-- > -->

**Random Selection Example** </br>
To add variety to your game's world, `SKAction.playSoundFileNamed(...)` also let's you set up an array of similar effects from which your code can randomly choose a sound file to play:

```swift  
let soundCarCrashesArray = [
  SKAction.playSoundFileNamed("carCrash1.wav", waitForCompletion: false),
  SKAction.playSoundFileNamed("carCrash2.wav", waitForCompletion: false),
  SKAction.playSoundFileNamed("carCrash3.wav", waitForCompletion: false)
]
```

Then, depending on game conditions, you could choose which of the similar effects to run:

```swift  
 run(soundCarCrashesArray[2])
```

<aside class="notes">
As you can imagine, you might also randomize the index of the array, which could allow your game to appear lively by choosing similar sounds, at random, for the same or similar game events.
</aside>

<!-- > -->

## In Class Activity

Let's add audio to AstroJunk...

Time to find some sounds:

- Add background music to be played while the game runs. Make the music stop at Game Over and any other appropriate game states
- Add sound FX to appropriate game events (collisions, points scored, etc.)

<!-- > -->

## Particle emitter

Adding particle systems to your games is an effective way to add special effects. With particle systems you can simulate: water, smoke, fire, snow, stars, sparks, rain, bubbles, explosions, and much more.

<!-- v -->

How the effect is created is by using a small image texture and a configuration file.

![particle2](assets/particle2.png)
*Source: 2D Apple Games by Tutorials*

<!-- v -->

SpriteKit makes it easy to create and use particle systems by giving you a special node named `SKEmitterNode`, its purpose is to make particle systems and render them as quickly as possible.

You can create particles programmatically or with the particle editor. The second one is helpful to use since you can make changes to the values making up the particle and see the results being animated.

<!-- v -->

To do this, you simply create a new file with the iOS/Resource/SpriteKit Particle File template. This will create an .sks file that can be modified with the editor.

Once in code you’ll only need to instantiate the particles with the file and a position. Then add the particle emitter as child in the scene.

```Swift
let fireEmitter = SKEmitterNode(fileNamed: "Fire.sks")!
fireEmitter.position = CGPoint(x: 200, y: 200)
addChild(fireEmitter)

```

You can check what all the properties do [here](particleProperties.md).

<!-- > -->

## Activity

Create an .sks file for a new particle emitter. You want to add fire to the spaceship as it flies. Play around with all the values of the particle emitter until you’re happy with the result.

This is an example of how it might turn out like:

![particle2](assets/fire.gif)

<!-- > -->

# After Class

Assignments:
1. Catch up with the game up to today's lesson.

<!-- > -->

## Additional Resources

1. The "Controlling the Audio of a Node" section of the [Action Initializers - Apple docs](https://developer.apple.com/documentation/spritekit/skaction/action_initializers)
2. Functions and properties in the "Configuring and Controlling Playback" and "Managing Information About a Sound" sections of the [AVAudioPlayer - Apple docs](https://developer.apple.com/documentation/avfoundation/avaudioplayer)
3. [Website on Game Feel](https://gameanalytics.com/blog/squeezing-more-juice-out-of-your-game-design.html)
4. [George Lucas Quote](https://quotefancy.com/quote/1021372/George-Lucas-The-sound-and-music-are-50-of-the-entertainment-in-a-movie)
5. [AVFoundation - wikipedia](https://en.wikipedia.org/wiki/AVFoundation)
6. [AVFoundation - Apple Docs](https://developer.apple.com/av-foundation/)
7. [AVFoundation - Apple Docs](https://developer.apple.com/documentation/avfoundation)
8. [Audio Track Engineering - Apple Docs](https://developer.apple.com/documentation/avfoundation/audio_track_engineering)

<!-- > -->

9. [About AVFoundation - Apple Docs](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/AVFoundationPG/Articles/00_Introduction.html)
10. [SKAudioNode - Apple Docs](https://developer.apple.com/documentation/spritekit/skaudionode)
11. [Background music with SKAudioNode, an intro, plus game over - an article](https://www.hackingwithswift.com/read/36/6/background-music-with-skaudionode-an-intro-plus-game-over)
12. [`playSoundFileNamed(_:waitForCompletion:)` - Apple Docs](https://developer.apple.com/documentation/spritekit/skaction/1417664-playsoundfilenamed)
13. [`listener` (property) - Apple docs](https://developer.apple.com/documentation/spritekit/skscene/1520363-listener)
