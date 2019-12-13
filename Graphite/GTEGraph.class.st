Class {
	#name : #GTEGraph,
	#superclass : #Object,
	#category : #Graphite
}

{ #category : #'add-remove' }
GTEGraph >> addAllNodes: aCollection [  
	aCollection do: [ : node | self addNode: node ]
]

{ #category : #'add-remove' }
GTEGraph >> addArc: anArc [
	self addAllNodes: anArc nodes.
	self basicAddOnlyArc: anArc. 
]

{ #category : #'add-remove' }
GTEGraph >> addNode: anObject [ 
	self subclassResponsibility 
]

{ #category : #accessing }
GTEGraph >> arcs [
	self subclassResponsibility 
]

{ #category : #accessing }
GTEGraph >> arcsFrom: anObject [
	^ self subclassResponsibility 
]

{ #category : #'add-remove' }
GTEGraph >> basicAddOnlyArc: anArc [
	self subclassResponsibility 
]

{ #category : #elements }
GTEGraph >> connect [
	^ GTEArcImplicitBuilder new
		  graph: self;
		  arcClass: GTEDirectedArc;
		  yourself
]

{ #category : #accessing }
GTEGraph >> elements [
	^ (self nodes , self arcs) asSet
]

{ #category : #testing }
GTEGraph >> isEmpty [
	^ self nodes isEmpty 
]

{ #category : #testing }
GTEGraph >> isNotEmpty [
	^ self nodes isNotEmpty
]

{ #category : #accessing }
GTEGraph >> nodes [
	self subclassResponsibility
]

{ #category : #accessing }
GTEGraph >> nodesFrom: aNode [
	^ ((self arcsFrom: aNode) collect: [ :arc | arc nodeToFrom: aNode ]) asSet
]

{ #category : #'add-remove' }
GTEGraph >> removeAllNodes: aCollection [
	aCollection do: [ :a | self removeNode: a ]
]

{ #category : #'add-remove' }
GTEGraph >> removeArc: aGTEArc [
	self subclassResponsibility 
]

{ #category : #'add-remove' }
GTEGraph >> removeArcNodes: aGTEArc [ 
	self removeAllNodes: aGTEArc nodes.
]

{ #category : #'add-remove' }
GTEGraph >> removeNode: anObject [ 
	self subclassResponsibility 
]

{ #category : #accessing }
GTEGraph >> size [
	^ self nodes size + self arcs size
]
