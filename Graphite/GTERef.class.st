Class {
	#name : #GTERef,
	#superclass : #Object,
	#type : #variable,
	#instVars : [
		'ref'
	],
	#category : #Graphite
}

{ #category : #constructor }
GTERef class >> ref: anInteger [
	^ self new
		  ref: anInteger;
		  yourself
]

{ #category : #accessing }
GTERef >> ref [
	^ ref
]

{ #category : #accessing }
GTERef >> ref: anInteger [
	ref := anInteger
]
