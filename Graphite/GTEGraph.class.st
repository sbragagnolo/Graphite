"
Graph is an abstract class that implements some general graph behaviour in between the different ways of representation of graphs. 
"
Class {
	#name : #GTEGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'map'
	],
	#category : #'Graphite-Core'
}

{ #category : #'add-remove' }
GTEGraph >> addAllNodes: aCollection [  
	aCollection do: [ : node | self addNode: node ]
]

{ #category : #references }
GTEGraph >> addAndRefer: anObject [

	self addNode: anObject.
	^ self referenceTo: anObject
]

{ #category : #'add-remove' }
GTEGraph >> addArc: anArc [
	self subclassResponsibility .
]

{ #category : #'add-remove' }
GTEGraph >> addNode: anObject [

	map at: anObject ifAbsentPut: [ 
		nodes add: anObject.
		nodes size  ]
]

{ #category : #'node operations' }
GTEGraph >> adjacent: aRef with: anOther [
	^ (self neighbours: aRef) includes: anOther
]

{ #category : #accessing }
GTEGraph >> arcs [
	self subclassResponsibility 
]

{ #category : #iterating }
GTEGraph >> arcsDo: aBlock [
	^ self arcs do: aBlock
]

{ #category : #accessing }
GTEGraph >> arcsFrom: anObject [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
GTEGraph >> arcsFromObject: anObject [
	| r |
	r := self referenceTo: anObject .
	^ self arcsFrom: r
]

{ #category : #accessing }
GTEGraph >> arcsRelating: aNode with: anOtherNode [
	^ (self arcsFrom: aNode)
		select: [ :a | a nodes includes: anOtherNode ]
]

{ #category : #references }
GTEGraph >> boundedReferenceTo: anObject [

	^ (GTEBoundedReference offset:
			   (map at: anObject ifAbsent: [ self error: 'Segmentation lolt' ]))
		  origin: self;
		  yourself
]

{ #category : #'graph operations' }
GTEGraph >> disjointUnion: anOtherGraph [
	"https://en.wikipedia.org/wiki/Disjoint_union"
	| t |
	" Take into account that if this graph and the second one have some node values in common, the usage of referenceTo: may not bring the reference you are looking for. "
	t := self copy.
	t addAllNodes: anOtherGraph nodes.
	anOtherGraph arcs do: [ :a | t addArc: (a copyWithReferenceShiftedBy: nodes size) ].
	^ t
]

{ #category : #accessing }
GTEGraph >> elements [
	^ (self nodes , self arcs) asSet
]

{ #category : #initialization }
GTEGraph >> initialize [
	super initialize.
	nodes := OrderedCollection new.
	map := Dictionary new. 
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
GTEGraph >> leaves [
	"Only valid for directed arcs ."
	^ nodes withIndexSelect: [ :n :i | 
		  self arcs noneSatisfy: [ :arc | arc from offset = i ] ]
]

{ #category : #'node operations' }
GTEGraph >> neighbours: aRef [
	^ (self arcsFrom: aRef)
		  select: [ :a | a canGoSomewhereFrom: aRef ]
		  thenCollect: [ :a | a nodeToFrom: aRef ]
]

{ #category : #accessing }
GTEGraph >> nodes [
	^ nodes 
]

{ #category : #'node operations' }
GTEGraph >> nodesDo: aBlock [
	^ nodes do: aBlock
]

{ #category : #accessing }
GTEGraph >> nodesFrom: aNode [
	^ ((self arcsFrom: aNode) collect: [ :arc | arc nodeToFrom: aNode ]) asSet
]

{ #category : #iterating }
GTEGraph >> nodesWithReferencesDo: aBlockClosure [
	^ nodes
		withIndexDo:
			[ :n :idx | aBlockClosure value: n value: (GTEUnBoundedReference offset: idx) ]
]

{ #category : #'as yet unclassified' }
GTEGraph >> privateDeltaOperationInstallNode: aNode atPosition: anInteger [
	| newCol ref |
	nodes size = (anInteger - 1)
		ifTrue: [ self addNode: aNode.
			ref := self referenceTo: aNode.
			self assert: ref offset = anInteger.
			^ self ].
	nodes size < anInteger
		ifTrue: [ newCol := OrderedCollection new: anInteger withAll: GTEEmptySlot.
			nodes withIndexDo: [ :each :idx | newCol at: idx put: each ].
			nodes := newCol ].
	self assert: (nodes at: anInteger) = GTEEmptySlot.
	nodes at: anInteger put: aNode
]

{ #category : #references }
GTEGraph >> referenceTo: anObject [

	^ GTEUnBoundedReference offset:
		  (map at: anObject ifAbsent: [ self error: 'Segmentation lolt' ])
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
GTEGraph >> removeArcsRelatedWith: anObject [
	self subclassResponsibility
]

{ #category : #'add-remove' }
GTEGraph >> removeNode: aRef [
	self removeArcsRelatedWith: aRef.
	nodes removeIndex: aRef offset
]

{ #category : #accessing }
GTEGraph >> roots [
	"Only valid for directed arcs ."
	^ nodes withIndexSelect: [ :n :i | 
		  self arcs noneSatisfy: [ :arc | arc to offset = i ] ]
]

{ #category : #accessing }
GTEGraph >> size [
	^ self nodes size + self arcs size
]

{ #category : #'graph operations' }
GTEGraph >> transposed [
	"https://en.wikipedia.org/wiki/Transpose_graph"
	| t |
	t := self species new.
	t addAllNodes: nodes.
	self arcs do: [ :a | t addArc: a transposed ].
	^ t
]

{ #category : #initialization }
GTEGraph >> useDirectedArcResolver [
	 " Just for polymorphism "
]

{ #category : #initialization }
GTEGraph >> useNonDirectedArcResolver [
	 " Just for polymorphism "
]

{ #category : #initialization }
GTEGraph >> useWeightedArcResolver [
	 " Just for polymorphism "
]
