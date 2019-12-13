"
Graphite Arc is an arc that connects two node objects. 
GTE arc is abstract of direction, therefore its implementation understand about 
	#nodes
	  that returns the two related nodes.
	#nodeToFrom: aNode
	  that returns other node than de received (where to go from the given node).
"
Class {
	#name : #GTEArc,
	#superclass : #Object,
	#type : #variable,
	#category : #Graphite
}

{ #category : #'instance creation' }
GTEArc class >> new [
	^ super new: 2
]

{ #category : #'instance creation' }
GTEArc class >> new: aNumber [
	^ self error: 'You may use new '.
]

{ #category : #'instance creation' }
GTEArc class >> nodes: anArray [
	^ self new
		  nodes: anArray asArray;
		  yourself
]

{ #category : #'as yet unclassified' }
GTEArc >> canGoSomewhereFrom: aNode [
	| one other |
	one := self at: 1.
	other := self at: 2.
	^ one == aNode or: [ other == aNode ]
]

{ #category : #'as yet unclassified' }
GTEArc >> initilize [
	super initialize.
	self assert: self size = 2
]

{ #category : #'as yet unclassified' }
GTEArc >> nodeToFrom: aNode [
	| one other |
	one := self at: 1.
	other := self at: 2.
	self assert: (self canGoSomewhereFrom: aNode).
	^ one == aNode
		  ifTrue: [ other ]
		  ifFalse: [ one ]
]

{ #category : #'as yet unclassified' }
GTEArc >> nodes [
	^ Set withAll: { 
			  (self at: 1).
			  (self at: 2) }
]

{ #category : #'as yet unclassified' }
GTEArc >> nodes: anArray [
	self assert: anArray size = 2.
	self at: 1 put: (anArray at: 1).
	self at: 2 put: (anArray at: 2).
]
