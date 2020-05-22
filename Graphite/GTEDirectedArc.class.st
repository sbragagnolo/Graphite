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
	#traits : 'TDirected',
	#classTraits : 'TDirected classTrait',
	#category : #'Graphite-Core'
}

{ #category : #'instance creation' }
GTEDirectedArc >> printOn: aStream [
	aStream
		nextPutAll: 'DArc( ';
		nextPutAll: (self from) asString;
		nextPutAll: ' => ';
		nextPutAll: (self to) asString;
		nextPutAll: ')'
]
