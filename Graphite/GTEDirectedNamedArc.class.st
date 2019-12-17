Class {
	#name : #GTEDirectedNamedArc,
	#superclass : #GTEDirectedArc,
	#type : #variable,
	#instVars : [
		'name'
	],
	#category : #Graphite
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
