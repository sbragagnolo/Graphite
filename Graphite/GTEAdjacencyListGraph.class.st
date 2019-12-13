"
The adjasent list implementation has two sets, one for the arcs, other for the nodes. 
Each arc preservs the relationship in between one and other node. 
"
Class {
	#name : #GTEAdjacencyListGraph,
	#superclass : #GTEGraph,
	#instVars : [
		'nodes',
		'arcs'
	],
	#category : #Graphite
}

{ #category : #elements }
GTEAdjacencyListGraph >> addNode: anObject [ 
	nodes add: anObject
]

{ #category : #elements }
GTEAdjacencyListGraph >> arcs [
	^ arcs 
]

{ #category : #elements }
GTEAdjacencyListGraph >> arcsFrom: anObject [
	^ arcs select: [ : a | a canGoSomewhereFrom: anObject ].
]

{ #category : #elements }
GTEAdjacencyListGraph >> basicAddOnlyArc: anArc [
	arcs add: anArc
]

{ #category : #elements }
GTEAdjacencyListGraph >> initialize [
	super initialize.
	nodes := Set new.
	arcs := Set new.
]

{ #category : #elements }
GTEAdjacencyListGraph >> nodes [
	^ nodes 
]

{ #category : #elements }
GTEAdjacencyListGraph >> removeArc: aGTEArc [
	arcs remove: aGTEArc
]

{ #category : #elements }
GTEAdjacencyListGraph >> removeNode: anObject [ 
	arcs := arcs reject: [ : a | a nodes includes: anObject ].
	nodes remove: anObject.
	
]
