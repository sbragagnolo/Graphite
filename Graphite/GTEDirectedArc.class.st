"
Graphite DirectedArc is an subclass of arc that connects two node objects with a specific direction. 

	#nodes
	  that returns the two related nodes.
	#nodeToFrom: aNode
	  nodeToFrom returns the to node, if the from is correct, it fails otherwise 
"
Class {
	#name : #GTEDirectedArc,
	#superclass : #GTEArc,
	#type : #variable,
	#category : #'Graphite-Core'
}

{ #category : #'instance creation' }
GTEDirectedArc >> canGoSomewhereFrom: aNode [
	^ self from = aNode
]

{ #category : #'instance creation' }
GTEDirectedArc >> from [ 
	^ self at: 2
]

{ #category : #'instance creation' }
GTEDirectedArc >> from: value [ 
	^ self at: 2 put: value
]

{ #category : #'instance creation' }
GTEDirectedArc >> nodeToFrom: aNode [
	self assert: aNode  = self from .
	^ self to.
]

{ #category : #'instance creation' }
GTEDirectedArc >> printOn: aStream [
	aStream
		nextPutAll: 'DArc( ';
		nextPutAll: (self from) asString;
		nextPutAll: ' => ';
		nextPutAll: (self to) asString;
		nextPutAll: ')'
]

{ #category : #'instance creation' }
GTEDirectedArc >> subscribeIntoAdjacencyMatrix: aGTEAdjacencyMatrixGraph [
	aGTEAdjacencyMatrixGraph subscribeDirectedArc: self from and: self to
]

{ #category : #'instance creation' }
GTEDirectedArc >> to [ 
	^ self at: 1
]

{ #category : #'instance creation' }
GTEDirectedArc >> to: value [
	^ self at: 1 put: value
]
