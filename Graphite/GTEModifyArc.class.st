Class {
	#name : #GTEModifyArc,
	#superclass : #GTEArcOperation,
	#instVars : [
		'newArc',
		'newOne',
		'newTwo',
		'newName'
	],
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTEModifyArc class >> operation [
	^ 2
]

{ #category : #accessing }
GTEModifyArc >> delegateTo: anOperator [
	anOperator
		deltaOperationSwapExistingArcOne: one
		to: newOne
		two: two
		to: newTwo
		name: name
		to: newName
]

{ #category : #accessing }
GTEModifyArc >> newOne: aRef two: anOtherRef name: aName [
	newOne := aRef. 
	newTwo := anOtherRef .
	newName := aName.
]
