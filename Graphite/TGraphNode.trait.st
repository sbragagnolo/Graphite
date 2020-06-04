"
This trait has as duty to allow a node to be configurable, and being able to have different layouts  
"
Trait {
	#name : #TGraphNode,
	#instVars : [
		'graph'
	],
	#category : #'Graphite-SlotExtention'
}

{ #category : #'as yet unclassified' }
TGraphNode >> graph [
	^ graph
]

{ #category : #'as yet unclassified' }
TGraphNode >> graph: aValue [
	aValue addNode: self.
	graph := aValue.
]
