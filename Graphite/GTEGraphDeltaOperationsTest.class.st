Class {
	#name : #GTEGraphDeltaOperationsTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'newGraph',
		'operator',
		'arcKind',
		'introspector'
	],
	#category : #'Graphite-Test'
}

{ #category : #'building suites' }
GTEGraphDeltaOperationsTest class >> testParameters [
	^ super testParameters
		forSelector: #newGraph
			addOptions:
			{[ GTEIncidenceMatrixGraph new ].
			[ GTEAdjacencyMatrixGraph new ].
			[ GTEAdjacencyListGraph new ]};
		forSelector: #arcKind
			addOptions:
			{GTEDirectedArc.
			GTEArc};
		yourself
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> arcKind: anArcClass [
	arcKind := anArcClass 
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> exampleTuples [
	^ {#(A B).
	#(B C).
	#(C A).
	#(D D).
	#(D A)}
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> newGraph: aGraphClass [
	newGraph := aGraphClass value
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> setUp [
	super setUp. 
	operator := GTEDeltaOperator new. 
	operator graph: newGraph.
	self setupGraph. 
	introspector := GTEDeltaIntrospector new.
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> setupGraph [
	self exampleTuples
		do: [ :tuple | 
			graph
				addArc:
					(arcKind new
						nodes:
							{(graph referenceTo: tuple first).
							(graph referenceTo: tuple second)};
						yourself) ]
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> testDeltasAreAllwaysTheSameAmount [
	| deltas |
	deltas := (introspector calculateOperationsForCreating:graph ).
	self assert: deltas size equals: 9
]

{ #category : #tests }
GTEGraphDeltaOperationsTest >> testWeArriveToTheSameGraphByApplyingDeltas [
	| deltas |
	deltas := introspector calculateOperationsForCreating: graph.
	operator applyAll: deltas.
	self assert: graph nodes equals: newGraph nodes.
	self assert: graph arcs equals: newGraph arcs
]
