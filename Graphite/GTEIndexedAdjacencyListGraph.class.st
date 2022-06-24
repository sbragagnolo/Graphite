Class {
	#name : #GTEIndexedAdjacencyListGraph,
	#superclass : #GTEAdjacencyListGraph,
	#instVars : [
		'to'
	],
	#category : #'Graphite-Core'
}

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> addArc: anArc [

	(arcs at: (self arcFrom: anArc) ifAbsentPut: [ Set new ]) add: anArc.
	(to at: (self arcTo: anArc) ifAbsentPut: [ Set new ]) add: anArc
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> arcFrom: aGTEArc [

	^ aGTEArc at: 2
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> arcTo: aGTEArc [

	^ aGTEArc at: 1
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> arcs [

	^ arcs values flatCollect: [ :a | a yourself ]
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> arcsFrom: anObject [

	^ arcs at: anObject ifAbsent: [ {  } ]
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> arcsTo: anObject [

	^ to at: anObject ifAbsent: [ {  } ]
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> arcsToObject: anObject [ 
		| r |
	r := self referenceTo: anObject .
	^ self arcsTo: r
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> initialize [
	super initialize .
	arcs := Dictionary new. 
	to := Dictionary new. 
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> leaves [

	"Only valid for directed arcs ."

	^ nodes reject: [ :n | arcs includesKey: (self referenceTo: n) ]
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> leavesForRelations: aFullBlockClosure [

	^ nodes select: [ :n | 
		  (self arcsToObject: n) anySatisfy: [ :rel | 
			  aFullBlockClosure value: rel ].
		  (self arcsFromObject: n) noneSatisfy: [ :rel | 
			  aFullBlockClosure value: rel ] ]
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> removeAll [ 
	self initialize
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> removeArc: aGTEArc [
	arcs
		at: (self arcFrom: aGTEArc)
		ifPresent: [ :c | c remove: aGTEArc ifAbsent: [  ] ].
	to
		at: (self arcTo: aGTEArc)
		ifPresent: [ :c | c remove: aGTEArc ifAbsent: [  ] ]
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> removeArcsRelatedWith: anObject [
	arcs at: anObject ifPresent: [ :c | c removeAll ].
	to at: anObject ifPresent: [ :c | c removeAll ]
]

{ #category : #initialization }
GTEIndexedAdjacencyListGraph >> roots [

	"Only valid for directed arcs ."

	^ nodes reject: [ :n | to includesKey: (self referenceTo: n) ]
]

{ #category : #'as yet unclassified' }
GTEIndexedAdjacencyListGraph >> rootsForRelations: aFullBlockClosure [

	^ nodes select: [ :n | 
		  (self arcsFromObject: n) anySatisfy: [ :rel | 
			  aFullBlockClosure value: rel ].
		  (self arcsToObject: n) noneSatisfy: [ :rel | 
			  aFullBlockClosure value: rel ] ]
]
