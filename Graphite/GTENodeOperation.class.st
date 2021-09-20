"
I represent an abstract node operation
"
Class {
	#name : #GTENodeOperation,
	#superclass : #GTEDeltaOperation,
	#instVars : [
		'reference',
		'node'
	],
	#category : #'Graphite-DeltaOperations'
}

{ #category : #'instance creation' }
GTENodeOperation class >> from: aGraphArcDelta [
	^ (self allSubclasses
		detect: [ :a | a operation = aGraphArcDelta operation ])
		loadFromDDSType: aGraphArcDelta
]

{ #category : #'as yet unclassified' }
GTENodeOperation class >> loadFromDDSType: aGraphNodeDelta [
	aGraphNodeDelta node type = #ByteSymbol
		ifFalse: [ self halt ].
	^ self new
		node: aGraphNodeDelta node values asSymbol;
		reference: (GTEUnBoundedReference new offset: aGraphNodeDelta node reference);
		yourself
]

{ #category : #applying }
GTENodeOperation >> node [
	^ node
]

{ #category : #applying }
GTENodeOperation >> node: aNode [
	node := aNode 
]

{ #category : #applying }
GTENodeOperation >> reference [
	^ reference 
]

{ #category : #applying }
GTENodeOperation >> reference: aRef [
	reference := aRef
]
