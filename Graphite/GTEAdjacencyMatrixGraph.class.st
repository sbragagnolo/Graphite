"
1 2 3 4 5 6 7
1  1 1 0 0 0 0 0
2  1 0 0 0 0 0 0
3  1 0 0 0 0 0 0
4  0 0 0 0 0 0 0
5  0 0 0 0 0 0 0
6  0 0 0 0 0 0 0
7  0 0 0 0 0 0 0

An Adjancency matrix is a graph representation that suppose a squared matrix, of #Node x #Node. 
Each cell in this matrix represents a relation.
The general (and default) values representation are 
 
* 1  non directed connection, or outgoing connection
* -1 incoming connection
* 0 no connection. 




  




"
Class {
	#name : #GTEAdjacencyMatrixGraph,
	#superclass : #GTEGraph,
	#instVars : [
		'matrix'
	],
	#category : #Graphite
}

{ #category : #private }
GTEAdjacencyMatrixGraph >> addArc: i node: j into: arcs [
	| inode jnode |
	inode := nodes at: i.
	jnode := nodes at: j.
	arcs add: (GTEArc
			 node: inode
			 coefficient: (matrix at: i at: j)
			 node: jnode
			 coefficient: (matrix at: j at: i))
]

{ #category : #'add-remove' }
GTEAdjacencyMatrixGraph >> addNode: anObject [
	(nodes includes: anObject) ifFalse: [ super addNode: anObject ]
]

{ #category : #accessing }
GTEAdjacencyMatrixGraph >> arcs [
	| arcs |
	arcs := Set new.
	1 to: nodes size do: [ :i | 
		i to: nodes size do: [ :j | 
			((matrix at: i at: j) = (matrix at: j at: i) and: [ 
				 (matrix at: j at: i) = 0 ]) ifFalse: [ 
				self addArc: i node: j into: arcs ] ] ].
	^ arcs
]

{ #category : #accessing }
GTEAdjacencyMatrixGraph >> arcsFrom: anObject [
	| arcs oid |
	arcs := Set new.
	oid := nodes indexOf: anObject.
	oid = 0 ifTrue: [ ^ arcs ].
	1 to: nodes size do: [ :i | 
		((matrix at: i at: oid) = (matrix at: oid at: i) and: [ 
			 (matrix at: oid at: i) = 0 ]) ifFalse: [ 
			self addArc: i node: oid into: arcs ] ].
	^ arcs
]

{ #category : #'add-remove' }
GTEAdjacencyMatrixGraph >> basicAddOnlyArc: aGTEArc [
	aGTEArc subscribeIntoAdjacencyMatrix: self
]

{ #category : #initialization }
GTEAdjacencyMatrixGraph >> initialize [
	super initialize.
	nodes := OrderedCollection new.
	matrix := GTEMatrix new
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> removeArcsRelatedWith: anObject [
	| oid |
	oid := nodes indexOf: anObject.
	matrix nullifyColumn: oid.
	matrix nullifyRow: oid
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> subscribeArc: aNode and: anOtherNode [
	| i j |
	i := nodes indexOf: aNode.
	j := nodes indexOf: anOtherNode.
	matrix at: i at: j put: 1.
	matrix at: j at: i put: 1
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> unsubscribeArc: aNode and: anOtherNode [ 
	| i j |
	i := nodes indexOf: aNode.
	j := nodes indexOf: anOtherNode.
	matrix at: i at: j put: 0.
	matrix at: j at: i put: 0
]
