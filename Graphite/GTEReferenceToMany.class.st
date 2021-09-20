"
The GTEReferenceToMany is an slot that delegates the referential value to a graph. The graph has to be accessible by the object using object
"
Class {
	#name : #GTEReferenceToMany,
	#superclass : #Slot,
	#category : #'Graphite-SlotExtention'
}

{ #category : #'meta-object-protocol' }
GTEReferenceToMany >> read: anObject [
	^ GTECollection new
		slot: self;
		object: anObject;
		yourself
]

{ #category : #'meta-object-protocol' }
GTEReferenceToMany >> write: aValue to: anObject [
	(anObject graph arcsFrom: (anObject graph referenceTo: anObject))
		select: [ :a | a name = self name ]
		thenDo: [ :a | anObject graph removeArc: a ].
	aValue
		do: [ :each | 
			anObject graph
				addArc:
					(GTEDirectedNamedArc new
						name: self name;
						from: (anObject graph referenceTo: anObject);
						to: (anObject graph referenceTo: each);
						yourself) ]
]
