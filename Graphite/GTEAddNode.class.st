"
I represent the addition of a new node into a graph
"
Class {
	#name : #GTEAddNode,
	#superclass : #GTENodeOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTEAddNode class >> operation [
	^ 4
]

{ #category : #applying }
GTEAddNode >> delegateTo: anOperator [
	^ anOperator deltaOperationAddNode: node reference: reference. 
]
