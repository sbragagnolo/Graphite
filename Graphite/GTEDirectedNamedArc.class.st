"
A directed named arc is a specific kind of arc that has an attached name.
This kind of arc is mean to be used with an adjacensy list represntation, since is the only one that stores the arcs. 
"
Class {
	#name : #GTEDirectedNamedArc,
	#superclass : #GTEDirectedArc,
	#type : #variable,
	#traits : 'TNamed',
	#classTraits : 'TNamed classTrait',
	#category : #'Graphite-Core'
}

{ #category : #accessing }
GTEDirectedNamedArc >> = anObject [

	^ super = anObject and: [ name = anObject name ]
]

{ #category : #visiting }
GTEDirectedNamedArc >> acceptVisitor: anAlceGraphToRoassal [

	^ anAlceGraphToRoassal
		  perform:
		  ('visitDirectedArcNamed{1}:' format: { name capitalized })
			  asSymbol
		  with: self
]

{ #category : #accessing }
GTEDirectedNamedArc >> hash [

	^ super hash bitXor: name hash
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
