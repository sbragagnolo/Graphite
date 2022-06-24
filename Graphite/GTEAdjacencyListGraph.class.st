"
The adjasent list implementation has two sets, one for the arcs, other for the nodes. 
Each arc preservs the relationship in between one and other node. 
"
Class {
	#name : #GTEAdjacencyListGraph,
	#superclass : #GTEGraph,
	#instVars : [
		'arcs'
	],
	#category : #'Graphite-Core'
}

{ #category : #elements }
GTEAdjacencyListGraph >> addArc: anArc [
	arcs add: anArc
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
GTEAdjacencyListGraph >> initialize [
	super initialize.
	arcs := Set new.
]

{ #category : #elements }
GTEAdjacencyListGraph >> removeArc: aGTEArc [
	arcs remove: aGTEArc
]

{ #category : #elements }
GTEAdjacencyListGraph >> removeArcsRelatedWith: anObject [
	arcs := arcs reject: [ : a | a nodes includes: anObject ].

	
]
