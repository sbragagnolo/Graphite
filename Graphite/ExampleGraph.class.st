"
This example is just a dummy example that uses a graph for storing values.
"
Class {
	#name : #ExampleGraph,
	#superclass : #Object,
	#traits : 'TGraphNode',
	#classTraits : 'TGraphNode classTrait',
	#instVars : [
		'#attr => GTEReferenceToOne'
	],
	#category : #'Graphite-Examples'
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
ExampleGraph >> attr: anInteger [ 
	attr := anInteger
]
