"
A  B  C
1  1  1  0
2  0  1 -1
3  1  0  1
4  0  0  0
5  0  0  0
6  0  0  0
7  0  0  0

An incidence matrix is a graph representation that suppose a rectangular matrix, of #Node x #Arc.

Each cell in this matrix represents a relation.
The general (and default) values representation are 
 
* 1  non directed connection, or outgoing connection
* -1 incoming connection
* 0 no connection. 

"
Class {
	#name : #GTEIncidenceMatrixGraph,
	#superclass : #GTEAbstractMatrixGraph,
	#instVars : [
		'freeList'
	],
	#category : #'Graphite-Core'
}

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
				privateAddArc: col
				node: inode
				node: jnode
				into: arcs ] ].
	^ arcs
]

{ #category : #private }
GTEIncidenceMatrixGraph >> arcsFrom: aRef [
	| arcs indexes |
	arcs := Set new.
	indexes := (matrix atRow: aRef offset) selectIndex: [ :e | e ~= 0 ].
	indexes do: [ :c | 
		| nodids inode jnode |
		nodids := (matrix atColumn: c) selectIndex: [ :e | e ~= 0 ].
		nodids size > 2 ifTrue: [ self error: 'More than 2?' ].
		inode := nodids at: 1.
		jnode := nodids size = 2
			         ifTrue: [ nodids at: 2 ]
			         ifFalse: [ inode ].
		self
			privateAddArc: c
			node: inode
			node: jnode
			into: arcs ].
	^ arcs
]

{ #category : #private }
GTEIncidenceMatrixGraph >> expandMatrix [
	|cardinality| 
	cardinality := matrix numberOfColumns.
	matrix expandColumns.
	freeList addAll: (cardinality + 1 to: matrix numberOfColumns)
]

{ #category : #private }
GTEIncidenceMatrixGraph >> initialize [
	super initialize.
	freeList := OrderedCollection new.

]

{ #category : #private }
GTEIncidenceMatrixGraph >> privateAddArc: arcid node: i node: j into: arcs [
	| c1 c2 |
	c1 := matrix at: i at: arcid.
	c2 := matrix at: j at: arcid.
	arcs add: (arcResolver 
			 node: (GTEInnerReference offset: i)
			 coefficient: c1
			 node: (GTEInnerReference offset: j)
			 coefficient: c2)
]

{ #category : #private }
GTEIncidenceMatrixGraph >> removeArcsRelatedWith: aNode [
	1 to: matrix numberOfColumns do: [ :a | 
		(matrix at: aNode offset at: a) ~= 0 ifTrue: [ 
			freeList add: a.
			1 to: matrix numberOfRows do: [ :r | matrix at: r at: a put: 0 ] ] ]
]

{ #category : #private }
GTEIncidenceMatrixGraph >> subscribeArc: aNode withValue: aNodeValue and: anOtherNode withValue: anOtherNodeValue [
	| column |
	freeList ifEmpty: [ self expandMatrix ].
	column := freeList removeFirst.
	matrix at: aNode offset at: column put: aNodeValue.
	matrix at: anOtherNode offset at: column put: anOtherNodeValue
]

{ #category : #private }
GTEIncidenceMatrixGraph >> unsubscribeArc: aNode and: anOtherNode [

	1 to: matrix numberOfColumns do: [ :a | 
		((matrix at: aNode offset at: a) ~= 0 and: [ (matrix at: anOtherNode offset at: a) ~= 0 ]) 
			ifTrue: [ 
				freeList add: a.
				matrix at: aNode offset at: a put: 0.
				matrix at: anOtherNode offset at: a put: 0 
			] 
	]
]
