"
An internal reference is a reference or offset to an specific graph node's position. 
It is internal and abstract, because is not yet bounded to an specific graph. 

This manage of reference allows the graph to be built on term of positions, and being able to define the relationships in term of relative positions
"
Class {
	#name : #GTEInnerReference,
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
GTEInnerReference class >> offset: anInteger [
	^ self new
		  offset: anInteger;
		  yourself
]

{ #category : #accessing }
GTEInnerReference >> offset [
	^ offset
]

{ #category : #accessing }
GTEInnerReference >> offset: anInteger [
	offset := anInteger
]

{ #category : #accessing }
GTEInnerReference >> printOn: aStream [
	aStream
		nextPutAll: 'ARef(offset=';
		nextPutAll: offset asString;
		nextPut: $)
]

{ #category : #accessing }
GTEInnerReference >> readValueFrom: aGraph [
	^ aGraph nodes at: offset
]
