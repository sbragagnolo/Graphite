Class {
	#name : #GTEAddNode,
	#superclass : #GTENodeOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #applying }
GTEAddNode >> delegateTo: anOperator [
	anOperator deltaOperationAddNode: node reference: reference. 
]
