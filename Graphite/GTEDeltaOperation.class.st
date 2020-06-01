Class {
	#name : #GTEDeltaOperation,
	#superclass : #Object,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #applying }
GTEDeltaOperation >> delegateTo: anOperator [
	self subclassResponsibility 
]
