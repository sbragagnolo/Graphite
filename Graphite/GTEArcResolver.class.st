"
I am in charge to resolve the class of an arc according to the given information. I am suitable for matrix based graphs, those that loose this information 
"
Class {
	#name : #GTEArcResolver,
	#superclass : #Object,
	#category : #'Graphite-Core'
}

{ #category : #accessing }
GTEArcResolver class >> default [
	^ self new
]

{ #category : #accessing }
GTEArcResolver class >> inferenceDirectedAndNonDirectedArcs [
	^ GTEArcResolver new .
]

{ #category : #accessing }
GTEArcResolver class >> resolvesArcsOfClass: aClass [
	^ GTEArcClassRelatedResolver new
		solvingClass: aClass;
		yourself
]

{ #category : #creating }
GTEArcResolver >> node: anObject coefficient: aCoefficientForNode node: anObject3 coefficient: aCoefficientForNode2 [
	| arc |
	self assert: ({ 1. -1 } includes: aCoefficientForNode).
	self assert: ({ 1. -1 } includes: aCoefficientForNode2).
	aCoefficientForNode = aCoefficientForNode2 ifTrue: [ 
		aCoefficientForNode = 1 ifTrue: [ 
			^ GTEArc nodes: { 
					  anObject.
					  anObject3 } ].
		"This case is a directed reflexive arc "
		aCoefficientForNode = -1 ifTrue: [ 
			^ GTEDirectedArc nodes: { 
					  anObject.
					  anObject3 } ].
		self error: 'The default arc resolver does not handle weighted arcs. ' ].
	arc := GTEDirectedArc new.
	aCoefficientForNode = -1
		ifTrue: [ 
			arc
				from: anObject3;
				to: anObject ]
		ifFalse: [ 
			arc
				from: anObject;
				to: anObject3 ].
	^ arc
]
