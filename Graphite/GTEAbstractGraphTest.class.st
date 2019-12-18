Class {
	#name : #GTEAbstractGraphTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'graph'
	],
	#category : #Graphite
}

{ #category : #'building suites' }
GTEAbstractGraphTest class >> testParameters [
	^ ParametrizedTestMatrix new
		  forSelector: #graph addOptions: { 
				  GTEIncidenceMatrixGraph.
				  GTEAdjacencyMatrixGraph.
				  GTEAdjacencyListGraph };
		  yourself
]

{ #category : #accessing }
GTEAbstractGraphTest >> graph: aGraphClass [
	graph := aGraphClass new 
]
