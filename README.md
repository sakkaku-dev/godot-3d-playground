## Blender Import to Godot

### Import Model/Animations from [Mixamo](https://www.mixamo.com/)
Step from [youtube video](https://www.youtube.com/watch?v=3Hk9ljcS1Ro). In case it ever gets down:
  - Download as `.fbx` file
  - Import to blender
  - If not already applied to the model
	- In Object Mode: select everything from imported model
	- Ctrl-A -> All Transforms -> Your model will not be in the center anymore
	- Go to Graph Editor: filter only the xyz location of the hips bone
	- Put the 2D Cursor to 0/0 and change the pivot point to 2D Cursor
	- Select all keyframe -> Scale on Y-Axis -> Type .01
  - If using root bone
	- Create root bone as parent of hips bone
	- In Graph Editor: Disable X and Z location values of hips bone
	- Copy those values to the root bone
  - If importing animation to existing model
	- Make sure you stash the animation (I use in Nonlinear Animation the Push Down Button)
	- Then the new imported skeleton can be deleted again
	- Then select the new animation and apply the same steps as above to reposition to center

### Export Model for Godot
At the time of writing the blender `.gltf` export works flawlessly with godot. So a simple
export to that file type is enough. Make sure all animations are exported and modifiers
are applied. Modifiers can automatically applied on export with an export setting.

My prefered method of import: Create a new scene and right click on root node. Click
`Merge from Scene` and select the exported `.gltf` file

### Managing Animations
At the beginning it was really complicated to understand what animations are now exported, so
a short summary. Everthing inside the Nonlinear Animation Panel (NAP) will get exported. So stash
any animation you want to export in there.

In the Dope Sheet > Action Editor, every animation marked with an `F` is saved. So they are not
removed even if they are not listed in the NAP. Animations marked with `0` will be deleted after
restarting blender. Animations with no prefix are saved only if they are still in the NAP.

### Errors
 - I had problems importing multiple animations at once (e.g all aim animations). All animations
 where the same or behaved strangly.
 	- It worked when importing one animation at a time and renaming downloaded animation.
 	(download and rename -> import in blender -> export as gltf -> merge scene -> and repeat)
	- The renaming was probably only for making import to blender work. Otherwise it would
	always crash.
