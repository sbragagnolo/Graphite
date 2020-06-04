Class {
	#name : #GTERemoveArc,
	#superclass : #GTEArcOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTERemoveArc class >> operation [
	^ 3
]

{ #category : #applying }
GTERemoveArc >> delegateTo: anOperator [
	anOperator deltaOperationRemoveArcOne: one two: two name: name.
	
]
