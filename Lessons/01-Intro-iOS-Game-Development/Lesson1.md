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


### Review of key concepts & classes

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


SKSpriteNode

The most common SKNode subclass is the SKSpriteNode class.

SKSpriteNode is a type of node that can display either a colored rectangle, or an image. In



#### SKScene
An instance of the `SKScene` class represents an active scene of content in SpriteKit.

A scene is the root node in a tree of SpriteKit nodes. This tree of nodes provides content that the scene animates and renders for display.

You can display or present a scene &mdash; that is, a collection of sprites &mdash; from inside an `SKView`, `SKRenderer`, or `WKInterfaceSKScene` object.

<!--
#### Creating a Sprite

To show a sprite to the player, you create an SKSpriteNode, configure its size and position, and then add it to your SKScene object: -->



#### Positioning

#### Game loop (timing & frames)


## In Class Activity I (30 min)

Intro to Astro Junk...

< Intro the game...explain how it will look, what it will be used for...
Demo the finished game...

>

< TODO: students to create all sprites, etc., needed in game that have been covered in TTs up to now >



## Overview/TT II (20 min)

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
1) Review lesson 05-Introduction-to-SpriteKit from MOB 1.1 course
- be prepared to answer questions on key components outlined in Lesson 5

20 Review:
- Game types:
  - RPG, FPS

  SKEffectNode
  SKWarpable protocol

  `SKView`, `SKRenderer`, or `WKInterfaceSKScene`


## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. Links to additional readings and videos


https://developer.apple.com/documentation/spritekit
