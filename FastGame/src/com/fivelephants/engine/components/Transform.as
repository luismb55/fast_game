package com.fivelephants.engine.components
{
	import com.fivelephants.engine.Component;
	
	import flash.geom.Point;
	
	public class Transform extends Component
	{
		private var _position:Point;
		private var _direction:Point;
		private var _scale:Point;
		private var _localPosition:Point;
		private var _localDirection:Point;
		private var _localScale:Point;
		
		protected var _parent:Transform;
		private var _children:Vector.<Transform> = new Vector.<Transform>();
		protected var _siblings:Vector.<Transform> = new Vector.<Transform>();
		
		public function Transform()
		{
			super();
			
			_position = new Point(0, 0);
			_direction = new Point(0, 0);
			_scale = new Point(1.0, 1.0);
			_localPosition = new Point(0, 0);
			_localDirection = new Point(0, 0);
			_localScale = new Point(1.0, 1.0);
		}
		
		/** Set the parent of the transform. 
		 * 
		 * If true, the parent-relative position, scale and rotation is modified such that the object keeps the same world space position, rotation and scale as before.
		 * 
		 * */
		public function setParent(p:Transform, worldPositionStays:Boolean = false):void
		{
			_parent = p;
			
			// TODO child and siblins
			_siblings.concat(_parent._children);
			_parent._children.push(this);
			
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
		
		public function get position():Point 
		{
			return _position;
		}
		
		public function set position(value:Point):void 
		{
			var delta:Point = value.subtract(_position);
			_position = value;
			
			// WRONG
			//_localPosition = _parent != null ? _position.subtract(_parent.position) : _position;
			
			for (var i:int = 0; i < _children.length; i++){
				_children[i].position = _children[i].position.add(delta);	
			}
		}
		
		public function get direction():Point 
		{
			return _direction;
		}
		
		public function set direction(value:Point):void 
		{
			_direction = value;
		}
		
		public function get scale():Point 
		{
			return _scale;
		}
		
		public function set scale(value:Point):void 
		{
			_scale = value;
		}
		
		public function get localPosition():Point 
		{
			return _localPosition;
		}
		
		public function set localPosition(value:Point):void 
		{
			var delta:Point = value.subtract(_localPosition);
			_localPosition = value;
			
			_position = _position.add(delta);
			
			for (var i:int = 0; i < _children.length; i++){
				_children[i].localPosition = _children[i].localPosition.add(delta);	
			}
		}
		
		public function get localDirection():Point 
		{
			return _localDirection;
		}
		
		public function set localDirection(value:Point):void 
		{
			_localDirection = value;
		}
		
		public function get localScale():Point 
		{
			return _localScale;
		}
		
		public function set localScale(value:Point):void 
		{
			_localScale = value;
		}
		
		public function get children():Vector.<Transform> 
		{
			return _children;
		}
		
		// when global changes, lcoal changes
		
		// TODO when local pos changed: update children pos
		// TODO when local scale changed: update children scale and pos
		// TODO when local rotation changed: update children rotation and pos
		
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