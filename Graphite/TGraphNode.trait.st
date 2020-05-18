"
This trait has as duty to allow a node to be configurable, and being able to have different layouts  
"
Trait {
	#name : #TGraphNode,
	#instVars : [
		'graphVariable'
	],
	#category : #'Graphite-SlotExtention'
}

{ #category : #'as yet unclassified' }
TGraphNode >> graph [
	^ self privateGraphVariable value
]

{ #category : #'as yet unclassified' }
TGraphNode >> graph: aValue [
	aValue addNode: self.
	^ self privateGraphVariable value: aValue
]

{ #category : #'as yet unclassified' }
TGraphNode >> graph: aGraph during: aBlock [ 
	aGraph addNode: self.
	^ self privateGraphVariable value: aGraph during: aBlock.
]

{ #category : #'as yet unclassified' }
TGraphNode >> privateGraphVariable [
	^ graphVariable ifNil: [ graphVariable := DynamicVariable new ].
]
