Class {
	#name : #GTEAddArc,
	#superclass : #GTEArcOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #applying }
GTEAddArc >> delegateTo: anOperator [
	anOperator deltaOperationAddArcOne: one two: two name: name.
]
