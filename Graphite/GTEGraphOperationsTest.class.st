"
""

	a   -> c
	  \    ^ 
	   \   |
	    -> b

""
"
Class {
	#name : #GTEGraphOperationsTest,
	#superclass : #GTEAbstractGraphTest,
	#instVars : [
		'a',
		'b',
		'c'
	],
	#category : #Graphite
}

{ #category : #running }
GTEGraphOperationsTest >> setUp [
	super setUp.
	a := graph referenceTo: Object new.
	b := graph referenceTo: Object new.
	c := graph referenceTo: Object new.
	
	"

	a   -> c
	  \    ^ 
	   \   |
	    -> b

"
	graph addArc: (GTEDirectedArc new
			 from: a;
			 to: c;
			 yourself).
	graph addArc: (GTEDirectedArc new
			 from: a;
			 to: b;
			 yourself).
	graph addArc: (GTEDirectedArc new
			 from: b;
			 to: c;
			 yourself)
]

{ #category : #running }
GTEGraphOperationsTest >> testSetupIsTheExpected [
	"

	a   -> c
	  \    ^ 
	   \   |
	    -> b

"

	self assert: (graph neighbours: a) size equals: 2.
	self assert: ((graph neighbours: a) includes: b).
	self assert: ((graph neighbours: a) includes: c).
	self assert: (graph neighbours: b) size equals: 1.
	self assert: ((graph neighbours: b) includes: c).
	self assert: (graph neighbours: c) size equals: 0
]

{ #category : #running }
GTEGraphOperationsTest >> testTransposedGraphGetsTheTransposedGraph [
	| transposed |
	"

	a   -> c
	  \    ^ 
	   \   |
	    -> b

"
	transposed := graph transposed.
	self assert: (transposed neighbours: c) size equals: 2.
	self assert: ((transposed neighbours: c) includes: b).
	self assert: ((transposed neighbours: c) includes: a).
	self assert: (transposed neighbours: b) size equals: 1.
	self assert: ((transposed neighbours: b) includes: a).
	self assert: (transposed neighbours: a) size equals: 0
]
