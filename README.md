About
========================
Become the 3D mesh pincher you always dreamed you could be!
First off, make sure you're up and running with Leap Motion drivers accesible on their website.
 
Your left hand rotates the object, your right hand pinches and deforms.

*Pinch recognition with the Leap isn't perfect, but there's an aquirable skill to getting reliable pinches: line up your fingers to the surface of the mesh then make a smooth, deliberate pinch while slowly moving outwards.*

The handle in the front of the scene brings up 5 different brush modes, linear, exponential, cubic, flat, and sin based falloff modes, which affect the way the vertices get pulled away from the mesh, so try them out!
On the left of that menu is a button to toggle the material on the object, and on the right is one to reset the verts.

The handle in the back brings up arrows to switch meshes, there's a variety of primitives to try out. **See below for info on loading in your own models!**


**If for any chance the red lights on your Leap aren't turning on, your hands won't be tracked and nothing will happen in the scene, so check your drivers and connection!**


The Code
========================

Working with the Leap unity tools can get tricky if you want a custom kind of input, basically in our case we want to send OnPinch messages to the mesh target, register where you started pinching, and pull some specific vertices along the Vector3 direction to where you're currently pinching.

**SculptVerts.cs**, which is a persistent static instance for sculpting, handles mesh deformation by cycling through all the verts every frame, moving ones in a range of your pinch if you're pinching. It has an enum for different kinds of deform patterns which can be set through the UI.

**SculptHand.cs** is the main input component, which is a modification of Leap's included PinchingHand.cs. It sends OnPinch and OnRelease triggers to:

**LeapInputManager.cs**, which sends them along to the sculpt object and the ui handles. It also assigns the current hand object to SculptVerts, so it knows where to get the pinch position from.

The UI is under the BrushSelectors and MeshSelectors objects, upon which GrabbableUI.cs enables you to pinch the handles to bring up the UI.

**To load in other meshes,** import your models and stick them in the Meshes[] array in SculptVerts.cs to add it to the list that gets cycled through with the ui arrows. Check the scale of your mesh to make sure it shows up at a reasonable size, then try it out!