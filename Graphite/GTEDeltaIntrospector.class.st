Class {
	#name : #GTEDeltaIntrospector,
	#superclass : #Object,
	#category : #'Graphite-DeltaOperations'
}

{ #category : #'as yet unclassified' }
GTEDeltaIntrospector >> calculateArcOperationsForCreating: aGraph [
	| deltas |

	deltas := OrderedCollection  new.

	aGraph arcsDo: [ : arc   | 
		deltas add: (GTEAddArc new one: (arc at:1 ) two: (arc at: 2 ) name: arc name ; yourself ).	
	].
	^ deltas .
]

{ #category : #'as yet unclassified' }
GTEDeltaIntrospector >> calculateNodeOperationsForCreating: aGraph [
	| deltas |

	deltas := OrderedCollection  new.
	aGraph nodesWithReferencesDo: [ : node : ref  |  
		deltas add: (GTEAddNode new node: node; reference: ref; yourself).	
	].
	
	^ deltas .
]

{ #category : #'as yet unclassified' }
GTEDeltaIntrospector >> calculateOperationsForCreating: aGraph [
	| deltas |

	deltas := OrderedCollection  new.
	aGraph nodesWithReferencesDo: [ : node : ref  |  
		deltas add: (GTEAddNode new node: node; reference: ref; yourself).	
	].
	aGraph arcsDo: [ : arc   | 
		deltas add: (GTEAddArc new arc: arc copy; yourself ).	
	].
	^ deltas .
]
