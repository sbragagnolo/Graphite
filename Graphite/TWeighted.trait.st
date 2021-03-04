"
Me i have a weight within :). 
I am used to search based solutions 
"
Trait {
	#name : #TWeighted,
	#instVars : [
		'weight'
	],
	#category : #'Graphite-Core'
}

{ #category : #accessing }
TWeighted >> privateMatricialValueForNode1 [
	^ weight
]

{ #category : #accessing }
TWeighted >> privateMatricialValueForNode2 [
	^ weight
]

{ #category : #accessing }
TWeighted >> weight [
	^ weight 
]

{ #category : #accessing }
TWeighted >> weight: aWeight [
	weight := aWeight 
]
