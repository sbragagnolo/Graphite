"
Graph is an abstract class that implements some general graph behaviour in between the different ways of representation of graphs. 
"
Class {
	#name : #GTEGraph,
	#superclass : #Object,
	#instVars : [
		'nodes'
	],
	#category : #Graphite
}

{ #category : #'add-remove' }
GTEGraph >> addAllNodes: aCollection [  
	aCollection do: [ : node | self addNode: node ]
]

{ #category : #'add-remove' }
GTEGraph >> addArc: anArc [
	self subclassResponsibility .
]

{ #category : #'add-remove' }
GTEGraph >> addNode: anObject [
	(nodes includes: anObject) ifFalse: [ nodes add: anObject ]
]

{ #category : #testing }
GTEGraph >> adjacent: aRef with: anOther [
	^ ((self neighbours: aRef) collect: #ref) includes: anOther ref
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

{ #category : #accessing }
GTEGraph >> elements [
	^ (self nodes , self arcs) asSet
]

{ #category : #accessing }
GTEGraph >> initialize [
	super initialize.
	nodes := OrderedCollection new.
]

{ #category : #testing }
GTEGraph >> isEmpty [
	^ self nodes isEmpty 
]

{ #category : #testing }
GTEGraph >> isNotEmpty [
	^ self nodes isNotEmpty
]

{ #category : #testing }
GTEGraph >> neighbours: aRef [
	^ (self arcsFrom: aRef) collect: [ :a | a nodeToFrom: aRef ]
]

{ #category : #accessing }
GTEGraph >> nodes [
	^ nodes 
]

{ #category : #accessing }
GTEGraph >> nodesFrom: aNode [
	^ ((self arcsFrom: aNode) collect: [ :arc | arc nodeToFrom: aNode ]) asSet
]

{ #category : #references }
GTEGraph >> referenceTo: anObject [ 
	self addNode: anObject.
	^ GTERef ref: (nodes indexOf: anObject)
]

{ #category : #'add-remove' }
GTEGraph >> removeAllNodes: aCollection [
	aCollection do: [ :a | self removeNode: a ]
]

{ #category : #'add-remove' }
GTEGraph >> removeArc: aGTEArc [
	aGTEArc unsubscribeFromAdjacencyMatrix: self
]

{ #category : #'add-remove' }
GTEGraph >> removeArcNodes: aGTEArc [ 
	self removeAllNodes: aGTEArc nodes.
]

{ #category : #'add-remove' }
GTEGraph >> removeArcsRelatedWith: anObject [
	self subclassResponsibility
]

{ #category : #'add-remove' }
GTEGraph >> removeNode: aRef [
	self removeArcsRelatedWith: aRef.
	nodes removeIndex: aRef ref
]

{ #category : #accessing }
GTEGraph >> size [
	^ self nodes size + self arcs size
]
