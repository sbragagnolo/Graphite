"
The GTEReferenceToOne is an slot that delegates the referential value to a graph. The graph has to be accessible by the object using object
"
Class {
	#name : #GTEReferenceToOne,
	#superclass : #Slot,
	#category : #'Graphite-SlotExtention'
}

{ #category : #'meta-object-protocol' }
GTEReferenceToOne >> read: anObject [

	^ (anObject graph arcsFrom: (anObject graph referenceTo: anObject))
		  detect: [ :a | a name = self name ]
		  ifFound: [ :a | 
			  (a nodeToFrom: (anObject graph referenceTo: anObject)) 
				  readValueFrom: anObject graph ]
		  ifNone: [ nil ]
]

{ #category : #'meta-object-protocol' }
GTEReferenceToOne >> write: aValue to: anObject [

	^ (anObject graph arcsFrom: (anObject graph referenceTo: anObject))
		detect: [ :a | a name = self name ]
		ifFound: [ :a | 
			aValue
				ifNil: [ anObject graph removeArc: a ]
				ifNotNil: [ a to: (anObject graph referenceTo: aValue) ] ]
		ifNone: [ aValue
				ifNotNil: [ anObject graph
						addArc:
							(GTEDirectedNamedArc new
								name: self name;
								from: (anObject graph referenceTo: anObject);
								to: (anObject graph referenceTo: aValue);
								yourself) ] ]
]
