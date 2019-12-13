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
	#category : #Graphite
}

{ #category : #'instance creation' }
GTEDirectedArc >> from [ 
	^ self at: 2
]

{ #category : #'instance creation' }
GTEDirectedArc >> nodeToFrom: aNode [
	self assert: aNode == self from.
	^ self to.
]

{ #category : #'instance creation' }
GTEDirectedArc >> to [ 
	^ self at: 1
]
