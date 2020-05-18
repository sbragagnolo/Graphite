"
A directed named arc is a specific kind of arc that has an attached name.
This kind of arc is mean to be used with an adjacensy list represntation, since is the only one that stores the arcs. 
"
Class {
	#name : #GTEDirectedNamedArc,
	#superclass : #GTEDirectedArc,
	#type : #variable,
	#instVars : [
		'name'
	],
	#category : #'Graphite-Core'
}

{ #category : #accessing }
GTEDirectedNamedArc >> name [ 
	^ name
]

{ #category : #accessing }
GTEDirectedNamedArc >> name: aName [
	name := aName asSymbol
]

{ #category : #accessing }
GTEDirectedNamedArc >> printOn: aStream [
	aStream
		nextPutAll: 'NamedArc( ';
		nextPutAll: self from asString;
		nextPutAll: ' =';
		nextPutAll: name;
		nextPutAll: '>';
		nextPutAll: self to asString;
		nextPutAll: ')'
]
