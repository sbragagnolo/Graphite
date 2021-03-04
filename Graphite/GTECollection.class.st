"
This collection delegates on the discover of the graph distribution according the node 
"
Class {
	#name : #GTECollection,
	#superclass : #SequenceableCollection,
	#instVars : [
		'slot',
		'object'
	],
	#category : #'Graphite-SlotExtention'
}

{ #category : #accessing }
GTECollection >> add: aNode [
	object graph
		addArc:
			(GTEDirectedNamedArc new
				name: slot name;
				from: (object graph referenceTo: object);
				to: (object graph referenceTo: aNode);
				yourself)
]

{ #category : #accessing }
GTECollection >> all [
	| reference |
	reference := object graph referenceTo: object.
	^ (object graph arcsFrom: reference)
		select: [ :a | a name = slot name ]
		thenCollect: [ :a | (a nodeToFrom: reference) readValueFrom: object graph ]
]

{ #category : #accessing }
GTECollection >> at: aNumber [
	| reference |
	reference := object graph referenceTo: object.
	^ ((((object graph arcsFrom: reference)
		select: [ :a | a name = slot name ]) at: aNumber)
		nodeToFrom: reference) readValueFrom: object graph
]

{ #category : #accessing }
GTECollection >> do: aBlock [
	| reference |
	reference := object graph referenceTo: object.
	^ (object graph arcsFrom: reference)
		select: [ :a | a name = slot name ]
		thenDo:
			[ :a | aBlock value: ((a nodeToFrom: reference) readValueFrom: object graph) ]
]

{ #category : #accessing }
GTECollection >> remove: oldObject ifAbsent: anExceptionBlock [
	| reference referenceOld |
	reference := object graph referenceFor: object.
	referenceOld := object graph referenceFor: oldObject.
	^ (object graph arcsFrom: reference)
		detect:
			[ :a | a name = slot name and: [ (a nodeToFrom: reference) = referenceOld ] ]
		ifFound: [ :a | object graph removeArc: a ]
		ifNone: [ anExceptionBlock value ]
]

{ #category : #accessing }
GTECollection >> size [
	| reference |
	reference := object graph referenceTo: object.
	^ (object graph arcsFrom: reference)
		count: [ :a | a name = slot name ]
]
