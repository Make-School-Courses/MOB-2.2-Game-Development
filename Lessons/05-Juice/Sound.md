__*AVAudioPlayer Example*__ </br>
This simple, non-working code snippet illustrates the key steps needed to add background music to a game app by implementing an instance of `AVAudioPlayer`:

```swift  
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
