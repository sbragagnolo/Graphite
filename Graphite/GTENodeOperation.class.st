Class {
	#name : #GTENodeOperation,
	#superclass : #GTEDeltaOperation,
	#instVars : [
		'reference',
		'node'
	],
	#category : #'Graphite-DeltaOperations'
}

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
