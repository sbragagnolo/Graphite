"
I
	am an arc with weight.
	No interested in directions.
	Like a two directions avenue
"
Class {
	#name : #GTEWeightedArc,
	#superclass : #GTEArc,
	#type : #variable,
	#traits : 'TWeighted',
	#classTraits : 'TWeighted classTrait',
	#category : #'Graphite-Core'
}

{ #category : #'instance creation' }
GTEWeightedArc class >> node: anObject coefficient: aCoefficientForNode node: anObject2 coefficient: aCoefficientForNode2 [
	^ (super
		node: anObject
		coefficient: aCoefficientForNode
		node: anObject2
		coefficient: aCoefficientForNode2)
		weight: aCoefficientForNode;
		yourself
]

{ #category : #accessing }
GTEWeightedArc >> printOn: aStream [
	aStream
		nextPutAll: 'WArc( ';
		nextPutAll: (self at: 1) asString;
		nextPutAll: '<=';
		nextPutAll: self weight asString;
		nextPutAll: '=>';
		nextPutAll: (self at: 2) asString;
		nextPutAll: ')'
		
]
