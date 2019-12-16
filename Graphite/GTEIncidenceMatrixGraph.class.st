Class {
	#name : #GTEIncidenceMatrixGraph,
	#superclass : #GTEAdjacencyMatrixGraph,
	#instVars : [
		'freeList'
	],
	#category : #Graphite
}

{ #category : #private }
GTEIncidenceMatrixGraph >> addArc: arcid node: i node: j into: arcs [
	| c1 c2 |
	c1 := matrix at: i at: arcid.
	c2 := matrix at: j at: arcid.
	arcs add: (GTEArc
			 node: i
			 coefficient: c1
			 node: j
			 coefficient: c2)
]

{ #category : #private }
GTEIncidenceMatrixGraph >> arcs [
	| arcs |
	arcs := Set new.
	1 to: matrix numberOfColumns do: [ :col | 
		| indexes inode jnode |
		indexes := (matrix atColumn: col) selectIndex: [ :e | e ~= 0 ].
		indexes ifNotEmpty: [ 
			indexes size > 2 ifTrue: [ self error: 'More than 2? ' ].
			inode := indexes at: 1.
			jnode := indexes size = 2
				         ifTrue: [ indexes at: 2 ]
				         ifFalse: [ indexes at: 1 ].
			self
				addArc: col
				node: inode
				node: jnode
				into: arcs ] ].
	^ arcs
]

{ #category : #private }
GTEIncidenceMatrixGraph >> arcsFrom: anObject [
	| arcs oid indexes |
	arcs := Set new.
	oid := nodes indexOf: anObject.
	indexes := (matrix atRow: oid) selectIndex: [ :e | e ~= 0 ].
	indexes do: [ :c | 
		| nodids inode jnode |
		nodids := (matrix atColumn: c) selectIndex: [ :e | e ~= 0 ].
		nodids size > 2 ifTrue: [ self error: 'More than 2?' ].
		inode := nodids at: 1.
		jnode := nodids size = 2
			         ifTrue: [ nodids at: 2 ]
			         ifFalse: [ inode ].
		self
			addArc: c
			node: inode
			node: jnode
			into: arcs ].
	^ arcs
]

{ #category : #private }
GTEIncidenceMatrixGraph >> initialize [
	super initialize.
	freeList := OrderedCollection new
]

{ #category : #private }
GTEIncidenceMatrixGraph >> removeArcsRelatedWith: aNode [
	| inode |
	inode := nodes indexOf: aNode.
	1 to: matrix numberOfColumns do: [ :a | 
		(matrix at: inode at: a) ~= 0 ifTrue: [ 
			freeList add: a.
			1 to: matrix numberOfRows do: [ :r | matrix at: r at: a put: 0 ] ] ]
]

{ #category : #private }
GTEIncidenceMatrixGraph >> subscribeArc: aNode and: anOtherNode [
	| column inode jnode |
	inode := nodes indexOf: aNode.
	jnode := nodes indexOf: anOtherNode.
	column := freeList
		          ifEmpty: [ matrix numberOfColumns + 1 ]
		          ifNotEmpty: [ freeList removeFirst ].
	matrix at: inode at: column put: 1.
	matrix at: jnode at: column put: 1
	
]

{ #category : #private }
GTEIncidenceMatrixGraph >> unsubscribeArc: aNode and: anOtherNode [
	| inode jnode |
	inode := nodes indexOf: aNode.
	jnode := nodes indexOf: anOtherNode.
	1 to: matrix numberOfColumns do: [ :a | 
		((matrix at: inode at: a) ~= 0 and: [ (matrix at: jnode at: a) ~= 0 ]) 
			ifTrue: [ 
				freeList add: a.
				matrix at: inode at: a put: 0.
				matrix at: jnode at: a put: 0 
			] 
	]
]