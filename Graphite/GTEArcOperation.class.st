"
I represent Arc operations (Add/Modify/Remove)
"
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

{ #category : #'as yet unclassified' }
GTEArcOperation class >> from: aGraphArcDelta [
	^ (self allSubclasses
		detect: [ :a | a operation = aGraphArcDelta operation ])
		loadFromDDSType: aGraphArcDelta
]

{ #category : #'as yet unclassified' }
GTEArcOperation class >> loadFromDDSType: aDelta [
	^ self new one: aDelta referenceNodeOne two: aDelta referenceNodeTwo name: aDelta name 
]

{ #category : #accessing }
GTEArcOperation >> one: aRef two: anOtherRef name: aName [
	one := aRef.
	two := anOtherRef. 
	name := aName
]
