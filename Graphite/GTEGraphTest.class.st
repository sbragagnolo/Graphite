"
I am a copy of class GTEDefaultGraphTest. This comment is copied from there, and might not be entirely accurate

This class contains tests
"
Class {
	#name : #GTEGraphTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'graph'
	],
	#category : #Graphite
}

{ #category : #'building suites' }
GTEGraphTest class >> testParameters [
	^ ParametrizedTestMatrix new
		  forSelector: #graph addOptions: { GTEAdjacencyMatrixGraph . GTEAdjacencyListGraph  };
		  yourself
]

{ #category : #tests }
GTEGraphTest >> graph: aGraphClass [
	graph := aGraphClass new 
]

{ #category : #tests }
GTEGraphTest >> testEmptyGraphHasSize0 [
	self assert: graph isEmpty.
	self assert: graph size equals: 0
]

{ #category : #tests }
GTEGraphTest >> testNewGraphAddsANode [
	graph addNode: Object new.
	self assert: graph size equals: 1.
]

{ #category : #tests }
GTEGraphTest >> testNewGraphAddsANodeIsNotEmpty [
	graph addNode: Object new.
	self assert: graph isNotEmpty
]

{ #category : #tests }
GTEGraphTest >> testNewGraphAddsTwiceANodeCountsAsOne [
	| object |
	object := Object new.
	graph
		addNode: object;
		addNode: object.
		
	self assert: graph size equals: 1
]

{ #category : #tests }
GTEGraphTest >> testNewGraphCanConnectAnObjectToASecondObjectAddingArcAndNodesAsElements [
	graph addArc: (GTEArc nodes: { 
				 Object new.
				 Object new }).
	self assert: graph size equals: 3
]

{ #category : #tests }
GTEGraphTest >> testNewGraphCanConnectAnObjectToItSelfAddingArcAndNodeAsElements [
	| object |
	object := Object new.
	graph addArc: (GTEArc nodes: { 
				 object.
				 object }).
	self assert: graph size equals: 2
]

{ #category : #tests }
GTEGraphTest >> testNewGraphIsEmpty [ 
	self assert: graph isEmpty.
]

{ #category : #tests }
GTEGraphTest >> testRemoveArcDoesNotRemoveNodes [
	| arc |
	arc := (GTEArc nodes: { 
				 Object new.
				 Object new }).
	graph addArc: arc.
	graph removeArc: arc. 
	self assert: graph size equals: 2
]

{ #category : #tests }
GTEGraphTest >> testRemoveArcNodesRemovesTwoNodesAndAllTheRelatedArcs [
	| arc |
	arc := GTEArc nodes: { 
			       Object new.
			       Object new }.
	graph addArc: arc.
	graph removeArcNodes: arc.
	self assert: graph size equals: 0
	
]

{ #category : #tests }
GTEGraphTest >> testRemoveNodeRemoveAllTheArcs [
	| arc object |
	object := Object new.
	arc := GTEArc nodes: { 
			       object.
			       Object new }.
	graph addArc: arc.
	graph removeNode: object.
	self assert: graph size equals: 1
]
