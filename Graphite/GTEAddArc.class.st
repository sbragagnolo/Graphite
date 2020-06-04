Class {
	#name : #GTEAddArc,
	#superclass : #GTEArcOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTEAddArc class >> operation [
	^ 1
]

{ #category : #applying }
GTEAddArc >> delegateTo: anOperator [
	^ anOperator deltaOperationAddArcOne: one two: two name: name 
]
