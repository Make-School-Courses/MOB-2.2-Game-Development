# Actions

<!-- INSTRUCTOR NOTES:
1) Quiz for Initial Exercise is located: -->


## Minute-by-Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Objectives                |
| 0:05        | 0:20      | Overview I: More Actions   |
| 0:25        | 0:30      | In Class Activity I       |
| 0:55        | 0:10      | BREAK                     |
| 1:05       | 0:20      | Overview II: Collision Detection   |
| 1:25        | 0:30      | In Class Activity II      |
| 1:45        | 0:05      | Wrap up review objectives |
| TOTAL       | 1:50      | -                         |

## Why you should know this or industry application (optional) (5 min)

Explain why students should care to learn the material presented in this class.

## Learning Objectives (5 min)

1. Identify and describe
1. Define
1. Design
1. Implement

## Initial Exercise (20 min)

To help you reinforce your learning and to confirm your understanding of the concepts presented so far...

Quiz...


## More Actions (20 min)

### Group Actions
In our last lesson we learned that sequence actions run other actions one after another.

But what if you want to run two or more actions at exactly the same time?

`group(_:)` creates an action that runs a collection of actions in parallel.

Creating groups is very similar to creating sequences.

To create a group, you pass in a collection of `SKAction` objects to the `group(_:)` method:

```Swift  
  let groupAction = SKAction.group([action1, action2, action3])
```

However, instead of running them one after the other, a group action runs them all at once.

When the group action executes, the collection of actions that comprise the group all start immediately and run in parallel.

The `duration` of the group action is the longest duration among the collection of actions. Thus, a group action does not complete until the longest-running action in its colletion has completed.

If an action in the group has a duration less than the group’s duration, the action completes, then idles until the group completes the remaining actions. *(This matters most when creating a repeating action that repeats a group; we will cover repeating actions in next lesson)*

Note that you can also combine groups and sequences.
- You can run two sequences at the same time by combining them into a group action
- You can also create sequences that contain group actions.


`group(_:)` action is also reversible; it creates a new group action that contains the reverse of each action specified in the group.


<!-- Moved these actions from prior lesson:


#### Wait action

#### Run-block


#### Repeating actions


## Touch events

## Playable area limitation

#### Wait-for duration action


#### Reversing actions -->


<!-- List from Syllabus outline 7/25/19:
AG Wait action
AG Run-block
Reversing actions
TV Repeating actions
TV Remove from parent action
Animation action
Stopping action
Scale action
Space game - aliens or bombs could grow and shrink
Rotate action
Space game - and meteorites could rotate
Group action
Combine any actions into groups -->



## Collision Detection (20 min)

So far we know how to get sprite nodes on screen. We also know how to make them move. But nothing works as a playable game yet. And this is in greater part because we are not handling how objects interact with each other. This can be done using collision detection. We detect when objects collide with each other to then assess what action should follow. An explosion? Adding points to the score? Collecting power ups or lives? It’s our job to handle all these possibilities.
How it works

There are several ways to handle collision detection. One of them is using the built-in physics engine and this one we’ll learn later in the course. Today we’ll use the easiest approach which is bounding-box collision detection.

### The main idea

We need a way to get all the elements in the scene into a collection or list so we can then check for collisions on each one. This is easy when we give every node a name at the moment of creation. Then we can use the method `enumerateChildNodes(withName:using:)` to find all the nodes matching a name.
Once we have the lists, we can loop on them to check for collisions. Each node has a frame property representing the node’s location on screen. This frame is a rectangle so keep in mind that even when you ave round sprites, the bounding box of all elements is a rectangle.
When you can have access to the frames, you can now use CGRect’s `intersects(_ :)` method to check for collisions.

### Trying it out

Playground demo + explanation

**Debugging**

- The problem with the update method.
- Bounding box bigger than sprite. Shrink the box using `insetBy(dx:dy:)`

## In Class Activity I (30 min)

Next steps for the Space Junk game:

- Include collision detection using the frame bounding box technique.
- Detect when the ship collides with either meteors or debris.
- (If `removefromparent` has been covered) once the ship collides with objects, make the object disappear from the scene.
Debug the frame of the objects to make the collision as realistic as possible.

## Touch Events
We need a way to interact with the game. A way to control how elements move in the scene. We can achieve this control using touch events. There are several methods we use for this.

```Swift   
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}

override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {}

override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}

override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}

```
All of them handle different stages in the lifetime of a touch: Begins, Moves, Ends and Canceled. Inside the body of these methods you can access a set of touches. This is due to the fact that we can have multiple touches at the same time in a scene.

We can access the first touch in the set.

`guard let touch = touches.first else{return}`

Or we can iterate through all of them.

```Swift
for touch in touches {
}
```

Every touch has a property called location which we can use to see where that touch happened in the scene.

`let location = touch.location(in: self)`

There’s a lot we can do with touches. Have a sprite follow our touches, activate special powers, shoot enemies, etc.

## In Class Activity II (20 min)

Next steps for the Space Junk game:

- Using touches, handle how the spaceship moves. We need it to move either left or right. What’s the best approach we can take? Think about it and implement a solution.

## Playable area

The ship now moves across the screen. Depending on how you implemented the movement it might happen to you that the ship goes off the scene. But we need it to be visible all the time. You can fix this in many ways. You can have it bounce back or stay at the edge of the screen. It’s up to you.

Create a method to check the bounds of the game.

```Swift
func boundsCheckSpaceship() {
}
```

Then grab the value of the limit that corresponds to the bottom left and bottom right of the screen.

 ```Swift
 let bottomLeft = CGPoint(x: ship.size.width/2, y: 0)
 let bottomRight = CGPoint(x: size.width - ship.size.width/2, y: 0)
 ```

Use these values to compare them with the ship’s position to know what to do depending on what you want the game to behave.

**Q: Where should we call the method?**

## Stretch challenge

For the Space Junk game, debug the playable area (make it visible with a rectangle) and see if it works the same for multiple screen sizes.



# After Class

Assignments:
1. Review:
-


## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. []()
1. []()
1. []()
1. []()
1. []()
