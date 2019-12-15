Class {
	#name : #GTEAdjacencyMatrixGraph,
	#superclass : #GTEGraph,
	#instVars : [
		'matrix'
	],
	#category : #Graphite
}

{ #category : #initialization }
GTEAdjacencyMatrixGraph >> initialize [
	super initialize.
	nodes := OrderedCollection new.
	matrix := GTEMatrix new
]
