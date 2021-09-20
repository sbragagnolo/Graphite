"
I represent a named thing. I am about setting a name to an Arc
"
Trait {
	#name : #TNamed,
	#instVars : [
		'name'
	],
	#category : #'Graphite-Core'
}

{ #category : #accessing }
TNamed >> name [ 
	^ name
]

{ #category : #accessing }
TNamed >> name: aName [
	name := aName asSymbol
]
