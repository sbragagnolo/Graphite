"
I am a reference that know it's owner. 

This kind of reference allows to have cross-graph transparent references.
"
Class {
	#name : #GTEBoundedReference,
	#superclass : #GTEUnBoundedReference,
	#type : #variable,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'origin'
	],
	#category : #'Graphite-Core'
}

{ #category : #comparing }
GTEBoundedReference >> origin: aGraph [
	origin := aGraph
]

{ #category : #comparing }
GTEBoundedReference >> printOn: aStream [
	aStream
		nextPutAll: 'BoundedRef(offset=';
		nextPutAll: offset asString;
		nextPut: $)
]

{ #category : #comparing }
GTEBoundedReference >> readValue [
	^ origin nodes at: offset
]

{ #category : #comparing }
GTEBoundedReference >> readValueFrom: aGraph [
	^ self readValue
]
