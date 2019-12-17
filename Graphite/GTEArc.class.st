"
Graphite Arc is an arc that connects two node objects. 
GTE arc is abstract of direction, therefore its implementation understand about 
	#nodes
	  that returns the two related nodes.
	#nodeToFrom: aNode
	  that returns other node than de received (where to go from the given node).
"
Class {
	#name : #GTEArc,
	#superclass : #Object,
	#type : #variable,
	#category : #Graphite
}

{ #category : #'instance creation' }
GTEArc class >> new [
	^ super new: 2
]

{ #category : #'instance creation' }
GTEArc class >> new: aNumber [
	^ self error: 'You may use new '.
]

{ #category : #creating }
GTEArc class >> node: anObject coefficient: aCoefficientForNode node: anObject3 coefficient: aCoefficientForNode2 [
	| arc |
	self assert: ({ 1. -1 } includes: aCoefficientForNode).
	self assert: ({ 1. -1 } includes: aCoefficientForNode2).
	aCoefficientForNode == aCoefficientForNode2 ifTrue: [ 
		aCoefficientForNode == 1 ifTrue: [ 
			^ self nodes: { 
					  anObject.
					  anObject3 } ].
		self error: 'wrong coefficients' ].
	arc := GTEDirectedArc new.
	aCoefficientForNode == -1
		ifTrue: [ 
			arc
				from: anObject3;
				to: anObject ]
		ifFalse: [ 
			arc
				from: anObject;
				to: anObject3 ].
	^ arc
]

{ #category : #'instance creation' }
GTEArc class >> nodes: anArray [
	^ self new
		  nodes: anArray asArray;
		  yourself
]

{ #category : #'as yet unclassified' }
GTEArc >> canGoSomewhereFrom: aNode [
	| one other |
	one := self at: 1.
	other := self at: 2.
	^ one ref = aNode ref or: [ other ref = aNode ref ]
]

{ #category : #'as yet unclassified' }
GTEArc >> initilize [
	super initialize.
	self assert: self size = 2
]

{ #category : #'as yet unclassified' }
GTEArc >> nodeToFrom: aNode [
	| one other |
	one := self at: 1.
	other := self at: 2.
	self assert: (self canGoSomewhereFrom: aNode).
	^ one ref == aNode ref
		  ifTrue: [ other ]
		  ifFalse: [ one ]
]

{ #category : #'as yet unclassified' }
GTEArc >> nodes [
	^ Set withAll: { 
			  (self at: 1).
			  (self at: 2) }
]

{ #category : #'as yet unclassified' }
GTEArc >> nodes: anArray [
	self assert: anArray size = 2.
	self at: 1 put: (anArray at: 1).
	self at: 2 put: (anArray at: 2).
]

{ #category : #subscription }
GTEArc >> printOn: aStream [
	aStream
		nextPutAll: 'Arc( ';
		nextPutAll: (self at: 1) asString;
		nextPutAll: ':';
		nextPutAll: (self at: 2) asString;
		nextPutAll: ')'
]

{ #category : #subscription }
GTEArc >> subscribeIntoAdjacencyMatrix: aGTEAdjacencyMatrixGraph [
	aGTEAdjacencyMatrixGraph subscribeArc: (self at: 1) and: (self at: 2)
]

{ #category : #unsubscribe }
GTEArc >> unsubscribeFromAdjacencyMatrix: aGTEAdjacencyMatrixGraph [ 
	aGTEAdjacencyMatrixGraph unsubscribeArc: (self at: 1) and: (self at: 2)
]
