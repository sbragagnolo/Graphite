"
An internal reference is a reference or offset to an specific graph node's position. 
It is internal and abstract, because is not yet bounded to an specific graph. 

This manage of reference allows the graph to be built on term of positions, and being able to define the relationships in term of relative positions
"
Class {
	#name : #GTEUnBoundedReference,
	#superclass : #Object,
	#type : #variable,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'offset'
	],
	#category : #'Graphite-Core'
}

{ #category : #constructor }
GTEUnBoundedReference class >> offset: anInteger [
	^ self new
		  offset: anInteger;
		  yourself
]

{ #category : #accessing }
GTEUnBoundedReference >> offset [
	^ offset
]

{ #category : #accessing }
GTEUnBoundedReference >> offset: anInteger [
	offset := anInteger
]

{ #category : #accessing }
GTEUnBoundedReference >> printOn: aStream [
	aStream
		nextPutAll: 'ARef(offset=';
		nextPutAll: offset asString;
		nextPut: $)
]

{ #category : #accessing }
GTEUnBoundedReference >> readValueFrom: aGraph [
	^ aGraph nodes at: offset
]
