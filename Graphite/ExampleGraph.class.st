Class {
	#name : #ExampleGraph,
	#superclass : #Object,
	#instVars : [
		'#graph',
		'#attr => GTESlot'
	],
	#category : #Graphite
}

{ #category : #'instance creation' }
ExampleGraph class >> on: aGraph [
	^ self new
		  graph: aGraph;
		  yourself
]

{ #category : #accessing }
ExampleGraph >> attr [
	^ attr
]

{ #category : #accessing }
ExampleGraph >> graph [
	^ graph
]

{ #category : #accessing }
ExampleGraph >> graph: aGraph [
	aGraph addNode: self.
	graph := aGraph
]
