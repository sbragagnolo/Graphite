Class {
	#name : #GTEMatrix,
	#superclass : #Object,
	#instVars : [
		'backend'
	],
	#category : #Graphite
}

{ #category : #initialization }
GTEMatrix >> initialize [
	super initialize.
	backend := Array2D rows: 0 columns: 0
]
