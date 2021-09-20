Class {
	#name : #GTEAbstractGraphTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'graph'
	],
	#category : #'Graphite-Test'
}

{ #category : #'building suites' }
GTEAbstractGraphTest class >> testParameters [

	^ ParametrizedTestMatrix new
		  forSelector: #graph addOptions: { 
				  [ GTEIncidenceMatrixGraph new ].
				  [ GTEAdjacencyMatrixGraph new ].
				  [ GTEAdjacencyListGraph new ].
				  [ GTEIndexedAdjacencyListGraph new ] };
		  yourself
]

{ #category : #accessing }
GTEAbstractGraphTest >> graph: aGraphClass [
	graph := aGraphClass value 
]
