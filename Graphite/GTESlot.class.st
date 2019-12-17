Class {
	#name : #GTESlot,
	#superclass : #Slot,
	#category : #Graphite
}

{ #category : #'meta-object-protocol' }
GTESlot >> read: anObject [
	^ (anObject graph arcsFrom: (anObject graph referenceTo: anObject))
		  detect: [ :a | a name = self name ]
		  ifFound: [ :a | 
			  (a nodeToFrom: (anObject graph referenceTo: anObject)) 
				  readValueFrom: anObject graph ]
		  ifNone: [ nil ]
]

{ #category : #'meta-object-protocol' }
GTESlot >> write: aValue to: anObject [
	^ (anObject graph arcsFrom: (anObject graph referenceTo: anObject))
		  detect: [ :a | a name = self name ]
		  ifFound: [ :a | a to: (anObject graph referenceTo:aValue) ]
		  ifNone: [ 
			  anObject graph addArc: (GTEDirectedNamedArc new
					   name: self name;
					   from: (anObject graph referenceTo: anObject);
					   to: (anObject graph referenceTo: aValue);
					   yourself) ]
]
