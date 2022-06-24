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
	#category : #'Graphite-Core'
}

{ #category : #'instance creation' }
GTEArc class >> new [
	^ super new: 2
]

{ #category : #'instance creation' }
GTEArc class >> new: aNumber [
	^ self error: 'You may use new '.
]

{ #category : #'instance creation' }
GTEArc class >> node: anObject coefficient: aCoefficientForNode node: anObject2 coefficient: aCoefficientForNode2 [
	self assert: aCoefficientForNode = aCoefficientForNode2.
	^ self
		nodes:
			{anObject.
			anObject2}
]

{ #category : #'instance creation' }
GTEArc class >> nodes: anArray [
	^ self new
		  nodes: anArray asArray;
		  yourself
]

{ #category : #comparing }
GTEArc >> = anObject [

	self species = anObject species ifFalse: [ ^ false ].
	((self at: 1) = (anObject at: 1) and: [ 
		 (self at: 2) = (anObject at: 2) ]) ifFalse: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
GTEArc >> canGoSomewhereFrom: aNode [
	| one other |
	one := self at: 1.
	other := self at: 2.
	^ one  = aNode  or: [ other  = aNode  ]
]

{ #category : #unsubscribe }
GTEArc >> copyWithReferenceShiftedBy: aNumber [
	| new |
	new := self copy.
	new at: 1 put: ((self at: 1) copy
			 offset: (self at: 1) offset + aNumber;
			 yourself).
	new at: 2 put: ((self at: 2) copy
			 offset: (self at: 2) offset + aNumber;
			 yourself)
]

{ #category : #comparing }
GTEArc >> hash [

	^ (self at: 1) hash bitXor: (self at: 2) hash
]

{ #category : #'as yet unclassified' }
GTEArc >> initilize [
	super initialize.
	self assert: self size = 2
]

{ #category : #'as yet unclassified' }
GTEArc >> nodeToFrom: aNode [
	| one other |
	self assert: (self canGoSomewhereFrom: aNode).
	
	one := self at: 1.
	other := self at: 2.
	
	^ one = aNode
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
GTEArc >> privateMatricialValueForNode1 [
	^ 1 
]

{ #category : #subscription }
GTEArc >> privateMatricialValueForNode2 [
	^ 1
]

{ #category : #subscription }
GTEArc >> subscribeIntoMatrix: aGTEAdjacencyMatrixGraph [
	aGTEAdjacencyMatrixGraph
		subscribeArc: (self at: 1)
		withValue: self privateMatricialValueForNode1
		and: (self at: 2)
		withValue: self privateMatricialValueForNode2
]

{ #category : #unsubscribe }
GTEArc >> transposed [
	| t |
	t := self copy.
	t at: 1 put: (self at: 2).
	t at: 2 put: (self at: 1).
	^ t
]

{ #category : #unsubscribe }
GTEArc >> unsubscribeFromMatrix: aGTEAdjacencyMatrixGraph [
	aGTEAdjacencyMatrixGraph
		unsubscribeArc: (self at: 1)
		and: (self at: 2)
]

{ #category : #unsubscribe }
GTEArc >> valuesToCompareForEquality [
	^ self nodes
]
