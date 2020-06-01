Class {
	#name : #GTEModifyNode,
	#superclass : #GTENodeOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #applying }
GTEModifyNode >> delegateTo: anOperator [
	anOperator deltaOperationSwapNodeAt: reference withNewNode: node
]
