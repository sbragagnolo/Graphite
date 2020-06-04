Class {
	#name : #GTERemoveNode,
	#superclass : #GTENodeOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTERemoveNode class >> operation [ 
	^ 6
]

{ #category : #applying }
GTERemoveNode >> delegateTo: anOperator [
	anOperator deltaOperationRemoveNode: node reference: reference. 
]
