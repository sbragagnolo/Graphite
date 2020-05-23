Class {
	#name : #GTEAbstractMatrixGraph,
	#superclass : #GTEGraph,
	#instVars : [
		'matrix',
		'arcResolver'
	],
	#category : #'Graphite-Core'
}

{ #category : #'add-remove' }
GTEAbstractMatrixGraph >> addArc: aGTEArc [
	aGTEArc subscribeIntoMatrix: self
]

{ #category : #initialization }
GTEAbstractMatrixGraph >> initialize [
	super initialize.
	matrix := GTEMatrix new.
	arcResolver := GTEArcResolver default. 
]

{ #category : #initialization }
GTEAbstractMatrixGraph >> useDirectedArcResolver [
	arcResolver := GTEArcResolver resolvesArcsOfClass: GTEDirectedArc.
]

{ #category : #initialization }
GTEAbstractMatrixGraph >> useNonDirectedArcResolver [
	arcResolver := GTEArcResolver resolvesArcsOfClass: GTEArc
]

{ #category : #initialization }
GTEAbstractMatrixGraph >> useWeightedArcResolver [
	arcResolver := GTEArcResolver resolvesArcsOfClass: GTEWeightedArc
]
