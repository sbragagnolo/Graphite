Class {
	#name : #GTEArcOperation,
	#superclass : #GTEDeltaOperation,
	#instVars : [
		'one',
		'two',
		'name'
	],
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTEArcOperation >> one: aRef two: anOtherRef name: aName [
	one := aRef.
	two := anOtherRef. 
	name := aName
]
