Class {
	#name : #GTERemoveNode,
	#superclass : #GTENodeOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #applying }
GTERemoveNode >> delegateTo: anOperator [
	anOperator deltaOperationRemoveNode: node reference: reference. 
]
