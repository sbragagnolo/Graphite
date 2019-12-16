Extension { #name : #SequenceableCollection }

{ #category : #'*Graphite' }
SequenceableCollection >> selectIndex: aBlockClosure [
	| each |
	^ self class new: self size streamContents: [ :stream | 
		  1 to: self size do: [ :index | 
			  (aBlockClosure value: (each := self at: index)) ifTrue: [ 
				  stream nextPut: index ] ] ]
]
