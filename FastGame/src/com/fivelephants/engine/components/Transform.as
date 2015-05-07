package com.fivelephants.engine.components
{
	import com.fivelephants.engine.Component;
	import com.fivelephants.engine.GameObject;
	
	import flash.geom.Point;
	
	public class Transform extends Component
	{
		private var _position:Point;
		//private var _direction:Point;
		private var _rotation:Number;
		private var _scale:Point;
		private var _localPosition:Point;
		//private var _localDirection:Point;
		private var _localRotation:Number;
		private var _localScale:Point;
		
		protected var _parent:Transform;
		private var _children:Vector.<Transform> = new Vector.<Transform>();
		protected var _siblings:Vector.<Transform> = new Vector.<Transform>();
		
		public function Transform()
		{
			super();
			
			_position = new Point(0, 0);
			//_direction = new Point(0, 0);
			_rotation = 0;
			_scale = new Point(1.0, 1.0);
			_localPosition = new Point(0, 0);
			_localRotation = 0;
			//_localDirection = new Point(0, 0);
			_localScale = new Point(1.0, 1.0);
		}
		
		/** Set the parent of the transform. 
		 * 
		 * If true, the parent-relative position, scale and rotation is modified such that the object keeps the same world space position, rotation and scale as before.
		 * 
		 * */
		public function setParent(p:Transform, worldPositionStays:Boolean = true):void
		{
			_parent = p;
			
			// TODO child and siblins
			_siblings.concat(_parent._children);
			_parent._children.push(this);
			
			if (worldPositionStays) { // TODO CHECK
				position = _localPosition;
			}else{
				localPosition = _position;
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
			// set position
			_position = value;
			
			// update local position
			_localPosition = _parent != null ? _localPosition = _position.subtract(_parent._position) :_position
			// update children position
			//TODO			
		}

		public function get rotation():Number 
		{
			return _rotation;
		}
		
		public function set rotation(value:Number):void 
		{
			var delta:Number = value - _rotation;
			
			// set rotation
			_rotation = value;
			// update local rotation
			_localRotation = _parent != null ? _rotation  - _parent._rotation : _rotation;
			
			// update children position
			// update children rotation
			var child:Transform;
			for(var i:int = 0; i < _children.length; i++){
				child = _children[i];	
				child.position = _position.add(rotatePoint(child._localPosition, delta));
				child.rotation = _rotation + child._localRotation;
			}
		}
		
		public function rotatePoint(p:Point, rotation:Number):Point
		{
			var rads:Number = deg2rads(rotation);
			var cos:Number = Math.cos(rads);
			var sin:Number = Math.sin(rads);
			
			return new Point(p.x*cos - p.y*sin, p.y*cos + p.x*sin);
		}
		
		public function deg2rads(degs:Number):Number
		{
			return degs / 180 * Math.PI; // TODO optimize by storing this number;
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
			// set local position
			_localPosition = value;
			
			// update global position
			_position = _parent != null ? _parent._position.add(_localPosition) : _localPosition;
			
			// update children position
			var child:Transform;
			
			for(var i:int = 0; i < _children.length; i++){
				child = _children[i];
				child.position = _position.add(child._localPosition);
			}
			
			return;
			
			
			//var delta:Point = value.subtract(_localPosition);
			//_localPosition = value;
		
			if(_parent != null){
				_position = _parent.position.add(_localPosition).add(value);//_localPosition.add(value);//value.subtract(_parent.position);
				_localPosition = _localPosition.add(value);
			}else
				_position = value;
			
			
			// update global position with setter
			/*if(_parent != null)
				_localPosition = _position.subtract(_parent._position);	
			else
				_localPosition = _position;*/
			
			
			
		}
		
		public function get localRotation():Number 
		{
			return _localRotation;
		}
		
		public function set localRotation(value:Number):void 
		{
			_localRotation = value;
			
			
		}
		
		/*public function get localDirection():Point 
		{
			return _localDirection;
		}
		
		public function set localDirection(value:Point):void 
		{
			_localDirection = value;
		}*/
		
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