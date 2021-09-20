"
I
	am all about defining the direction of an arc.
	My second position is from.
	my first position to.
	Right to left.
	Deal with it.
	I am counter intuitive to push my users to use my API instead of a
		counter intuitive implementation. Cheers 
"
Trait {
	#name : #TDirected,
	#category : #'Graphite-Core'
}

{ #category : #'instance creation' }
TDirected >> canGoSomewhereFrom: aNode [
	^ self from = aNode
]

{ #category : #'instance creation' }
TDirected >> from [ 
	^ self at: 2
]

{ #category : #'instance creation' }
TDirected >> from: value [ 
	^ self at: 2 put: value
]

{ #category : #'instance creation' }
TDirected >> nodeToFrom: aNode [
	self assert: aNode  = self from .
	^ self to.
]

{ #category : #'instance creation' }
TDirected >> privateDirectedFromValue [
	^ self privateMatricialValueForNode2
]

{ #category : #'instance creation' }
TDirected >> privateDirectedToValue [
	^ self privateMatricialValueForNode1 * -1 
]

{ #category : #'instance creation' }
TDirected >> subscribeIntoMatrix: aGTEAdjacencyMatrixGraph [
	aGTEAdjacencyMatrixGraph
		subscribeArc: self from
		withValue: self privateDirectedFromValue
		and: self to
		withValue: self privateDirectedToValue
]

{ #category : #'instance creation' }
TDirected >> to [ 
	^ self at: 1
]

{ #category : #'instance creation' }
TDirected >> to: value [
	^ self at: 1 put: value
]
