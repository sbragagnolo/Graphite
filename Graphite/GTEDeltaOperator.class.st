"
I am in charge to interpret operations and apply them into a given graph. 
"
Class {
	#name : #GTEDeltaOperator,
	#superclass : #Object,
	#instVars : [
		'graph'
	],
	#category : #'Graphite-DeltaOperations'
}

{ #category : #'as yet unclassified' }
GTEDeltaOperator >> apply: anOperation [ 
	anOperation delegateTo: self
]

{ #category : #'as yet unclassified' }
GTEDeltaOperator >> applyAll: aSetOfOperations [
	aSetOfOperations do: [ : op | self apply: op].
	
]

{ #category : #'as yet unclassified' }
GTEDeltaOperator >> deltaOperationAddArcOne: one two: two name: name [
	graph
		addArc:
			(GTEDirectedNamedArc new
				nodes:
					{one.
					two};
				name: name;
				yourself)
]

{ #category : #'as yet unclassified' }
GTEDeltaOperator >> deltaOperationAddNode: aNode reference: aGTEReference [ 
	graph privateDeltaOperationInstallNode: aNode atPosition: aGTEReference offset.
]

{ #category : #'as yet unclassified' }
GTEDeltaOperator >> graph: aGraph [
	graph := aGraph
]
