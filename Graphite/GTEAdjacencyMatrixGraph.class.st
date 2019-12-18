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

{ #category : #'add-remove' }
GTEAdjacencyMatrixGraph >> addArc: aGTEArc [
	aGTEArc subscribeIntoAdjacencyMatrix: self
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> addArc: i node: j into: arcs [
	arcs add: (GTEArc
			 node: (GTEInnerReference offset: i)
			 coefficient: (matrix at: i at: j)
			 node: (GTEInnerReference offset: j)
			 coefficient: (matrix at: j at: i))
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
	| arcs |
	arcs := Set new.
	anObject offset = 0 ifTrue: [ ^ arcs ].
	1 to: nodes size do: [ :i | 
		((matrix at: i at: anObject offset) = (matrix at: anObject offset at: i) 
			 and: [ (matrix at: anObject offset at: i) = 0 ]) ifFalse: [ 
			self addArc: i node: anObject offset into: arcs ] ].
	^ arcs
]

{ #category : #initialization }
GTEAdjacencyMatrixGraph >> initialize [
	super initialize.
	matrix := GTEMatrix new
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> removeArcsRelatedWith: anObject [
	matrix nullifyColumn: anObject offset.
	matrix nullifyRow: anObject offset
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> subscribeArc: aNode and: anOtherNode [
	matrix at: aNode offset at: anOtherNode offset put: 1.
	matrix at: anOtherNode offset at: aNode offset put: 1
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> subscribeDirectedArc: from and: to [
	matrix at: from offset at: to offset put: 1.
	matrix at: to offset at: from offset put: -1
]

{ #category : #private }
GTEAdjacencyMatrixGraph >> unsubscribeArc: aNode and: anOtherNode [ 
	matrix at: aNode offset at: anOtherNode offset put: 0.
	matrix at: anOtherNode offset at: aNode offset put: 0
]
