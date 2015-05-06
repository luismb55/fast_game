package com.fivelephants.engine.components
{
	import com.fivelephants.engine.Component;
	
	import flash.geom.Point;
	
	public class Transform extends Component
	{
		public var position:Point = new Point(0, 0);
		public var direction:Point = new Point(0, 0);
		public var scale:Point = new Point(1.0, 1.0);
		
		protected var _parent:Transform;
		
		public function Transform()
		{
			super();
			
			position = new Point(0, 0);
			direction = new Point(0, 0);
			scale = new Point(1.0, 1.0);
		}
		
		/** Set the parent of the transform. 
		 * 
		 * If true, the parent-relative position, scale and rotation is modified such that the object keeps the same world space position, rotation and scale as before.
		 * 
		 * */
		public function set parent(p:Transform, worldPositionStays:Boolean = false):void
		{
			_parent = p;
			
			if (worldPositionStays){ // TODO CHECK
				/*_parent.position = p.position.add(position);
				direction = p.direction.add(direction);
				scale = p.scale.add(scale);*/
			}
		}
		
		/** The parent of the transform. */
		public function get parent():Transform
		{
			return _parent;
		}
		
		/*childCount	The number of children the Transform has.
		eulerAngles	The rotation as Euler angles in degrees.
		forward	The blue axis of the transform in world space.
		hasChanged	Has the transform changed since the last time the flag was set to 'false'?
		localEulerAngles	The rotation as Euler angles in degrees relative to the parent transform's rotation.
		localPosition	Position of the transform relative to the parent transform.
		localRotation	The rotation of the transform relative to the parent transform's rotation.
		localScale	The scale of the transform relative to the parent.
		localToWorldMatrix	Matrix that transforms a point from local space into world space (Read Only).
		lossyScale	The global scale of the object (Read Only).
		position	The position of the transform in world space.
		right	The red axis of the transform in world space.
		root	Returns the topmost transform in the hierarchy.
		rotation	The rotation of the transform in world space stored as a Quaternion.
		up	The green axis of the transform in world space.
		worldToLocalMatrix	Matrix that transforms a point from world space into local space (Read Only).*/
		
		/*DetachChildren	Unparents all children.
		Find	Finds a child by name and returns it.
		GetChild	Returns a transform child by index.
		GetSiblingIndex	Gets the sibling index.
		InverseTransformDirection	Transforms a direction from world space to local space. The opposite of Transform.TransformDirection.
		InverseTransformPoint	Transforms position from world space to local space. The opposite of Transform.TransformPoint.
		InverseTransformVector	Transforms a vector from world space to local space. The opposite of Transform.TransformVector.
		IsChildOf	Is this transform a child of parent?
		LookAt	Rotates the transform so the forward vector points at /target/'s current position.
		Rotate	Applies a rotation of eulerAngles.z degrees around the z axis, eulerAngles.x degrees around the x axis, and eulerAngles.y degrees around the y axis (in that order).
		RotateAround	Rotates the transform about axis passing through point in world coordinates by angle degrees.
		SetAsFirstSibling	Move the transform to the start of the local transfrom list.
		SetAsLastSibling	Move the transform to the end of the local transfrom list.
		//SetParent	Set the parent of the transform.
		SetSiblingIndex	Sets the sibling index.
		TransformDirection	Transforms direction from local space to world space.
		TransformPoint	Transforms position from local space to world space.
		TransformVector	Transforms vector from local space to world space.
		Translate	Moves the transform in the direction and distance of translation.*/
	}
}