Class {
	#name : #GTERemoveArc,
	#superclass : #GTEArcOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #applying }
GTERemoveArc >> delegateTo: anOperator [
	anOperator deltaOperationRemoveArcOne: one two: two name: name.
	
]
