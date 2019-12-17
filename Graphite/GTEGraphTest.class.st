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
		  forSelector: #graph addOptions: { 
				  GTEIncidenceMatrixGraph.
				  GTEAdjacencyMatrixGraph.
				  GTEAdjacencyListGraph };
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
GTEGraphTest >> testNewGraphAddsANodeReferral [
	graph referenceTo: Object new.
	self assert: graph size equals: 1.
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
				 (graph referenceTo: Object new).
				 (graph referenceTo: Object new) }).
	self assert: graph size equals: 3
]

{ #category : #tests }
GTEGraphTest >> testNewGraphCanConnectAnObjectToItSelfAddingArcAndNodeAsElements [
	| object |
	object := (graph referenceTo: Object new).
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
GTEGraphTest >> testReferenceGeneratesSucessiveIds [
	1 to: 1000 do: [ :i | 
	self assert: (graph referenceTo: Object new) ref equals: i ].
	self assert: graph size equals: 1000
]

{ #category : #tests }
GTEGraphTest >> testRemoveArcDoesNotRemoveNodes [
	| arc ref1 ref2 |
	ref1 := graph referenceTo: Object new.
	ref2 := graph referenceTo: Object new.
	arc := GTEArc nodes: { 
			       ref1.
			       ref2 }.
	
	graph addArc: arc.
	graph removeArc: arc.
	self assert: graph size equals: 2
]

{ #category : #tests }
GTEGraphTest >> testRemoveArcNodesRemovesTwoNodesAndAllTheRelatedArcs [
	| arc |
	arc := GTEArc nodes: { 
			       (graph referenceTo: Object new).
			       (graph referenceTo: Object new) }.
	graph addArc: arc.
	graph removeArcNodes: arc.
	self assert: graph size equals: 0
]

{ #category : #tests }
GTEGraphTest >> testRemoveNodeRemoveAllTheArcs [
	| arc object |
	object := graph referenceTo: Object new.
	arc := GTEArc nodes: { 
			       object.
			       (graph referenceTo: Object new) }.
	graph addArc: arc.
	graph removeNode: object.
	self assert: graph size equals: 1
]
