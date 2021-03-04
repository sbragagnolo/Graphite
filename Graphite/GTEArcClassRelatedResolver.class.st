"
I resolve arcs of a single class. 

"
Class {
	#name : #GTEArcClassRelatedResolver,
	#superclass : #GTEArcResolver,
	#instVars : [
		'solvingClass'
	],
	#category : #'Graphite-Core'
}

{ #category : #creating }
GTEArcClassRelatedResolver >> node: anObject coefficient: aCoefficientForNode node: anObject3 coefficient: aCoefficientForNode2 [
	^ solvingClass
		node: anObject
		coefficient: aCoefficientForNode
		node: anObject3
		coefficient: aCoefficientForNode2
]

{ #category : #creating }
GTEArcClassRelatedResolver >> solvingClass: aClass [
	solvingClass := aClass
]
