Class {
	#name : #GTEModifyNode,
	#superclass : #GTENodeOperation,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #accessing }
GTEModifyNode class >> operation [
	^ 5
]

{ #category : #applying }
GTEModifyNode >> delegateTo: anOperator [
	anOperator deltaOperationSwapNodeAt: reference withNewNode: node
]
