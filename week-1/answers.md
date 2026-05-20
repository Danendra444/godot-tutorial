# Week 1 - Godot Interface: Exercise Answers

**Name:** Danendra Giantoro  
**Class:** 11 MIT

---

## Q1 - Sprite2D vs AnimatedSprite2D

`Sprite2D` is used to display a single static image, while `AnimatedSprite2D` is used to display a collection of frames played in sequence to create an animation.

The `Slime` scene uses `Sprite2D` because the slime only moves in a straight line and does not require any special animations — a single static image is sufficient. The `Player` scene uses `AnimatedSprite2D` because the player character has multiple movements (idle, walk, jump), each of which requires its own set of animation frames.

---

## Q2 - RigidBody2D vs CharacterBody2D

**Similarities:** Both are physics bodies that have a collision system, meaning they can collide with and be collided by other objects in the scene.

**Differences:** The key difference lies in who controls their movement. `RigidBody2D` is controlled automatically by the physics engine — gravity, momentum, and collision responses are all calculated by Godot without any code needed. `CharacterBody2D` is controlled through code (GDScript) — we must manually write the movement logic ourselves.

This is why the `Slime` uses `RigidBody2D` (the physics engine handles everything automatically), while the `Player` uses `CharacterBody2D` so that its movement can be controlled directly by player input.

---

## Q3 - Modifying Speed and Jump Power

After changing the `Player`'s `Speed` from 300 to 900 and `Jump Power` from -400 to -800, the character moved significantly faster when moving left and right, and the jump height became much higher than before.

*(Values were reverted to their original settings after observation.)*

---

## Q4 - Disabling CollisionShape2D on the Slime

After ticking the `disabled` attribute on the `Slime`'s `CollisionShape2D` node, the slime fell straight through the floor and continued falling downward until it disappeared off-screen.

This happened because `CollisionShape2D` defines the physical boundary of an object for the collision system. When it is disabled, the slime loses the ability to detect and respond to collisions with other objects — including the floor. Since the slime's root node is a `RigidBody2D` and gravity still applies automatically, there is nothing left to stop it from falling indefinitely.

*(The `disabled` attribute was reverted after observation.)*

---

## Q5 - Modifying Position, Rotation, and Scale of the Slime

Modifying **Position** (X/Y) moved the slime to a different location in the viewport corresponding to the values entered.

Modifying **Rotation** tilted/rotated the slime by the specified angle (e.g., setting it to 45 caused the slime to appear rotated 45 degrees).

Modifying **Scale** (X/Y) resized the slime — setting both axes to 2 made the slime appear twice as large as its original size in the viewport.

*(All values were reverted to their original settings after observation.)*
