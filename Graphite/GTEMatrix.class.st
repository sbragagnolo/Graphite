"
This class looks to normalize all possible backends for our matrixes: Array2D, ByteArray2D, BitArray2D, NBitslengthArray2D
"
Class {
	#name : #GTEMatrix,
	#superclass : #Object,
	#instVars : [
		'backend'
	],
	#category : #'Graphite-Core'
}

{ #category : #accessing }
GTEMatrix >> at: anInteger at: anInteger2 [
	^ (anInteger > backend numberOfRows or: [ 
		   anInteger2 > backend numberOfColumns ])
		  ifTrue: [ 0 ]
		  ifFalse: [ backend at: anInteger at: anInteger2 ]
]

{ #category : #accessing }
GTEMatrix >> at: rowNumber at: columnNumber put: value [
	self ensureMinimalSize: rowNumber and: columnNumber.
	backend at: rowNumber at: columnNumber put: value
]

{ #category : #accessing }
GTEMatrix >> atColumn: anInteger [ 
	^ backend atColumn: anInteger 
]

{ #category : #accessin }
GTEMatrix >> atRow: anInteger [
	^ backend atRow: anInteger
]

{ #category : #extending }
GTEMatrix >> ensureMinimalSize: rows and: columns [
	| bkend |
	(backend numberOfRows <= rows or: [ 
		 backend numberOfColumns <= columns ]) ifTrue: [ 
		| rowsNewSize columnsNewSize |
		rowsNewSize := (rows * 1.5 + 1) ceiling max:backend numberOfRows.
		columnsNewSize := (columns * 1.5 + 1) ceiling max:backend numberOfColumns.
		
		
		bkend := Array2D
			         rows: rowsNewSize
			         columns:columnsNewSize
			         tabulate: [ :i :j | 
				         (i <= backend numberOfRows and: [ 
					          j <= backend numberOfColumns ])
					         ifTrue: [ backend at: i at: j ]
					         ifFalse: [ 0 ] ].
		backend := bkend ]
]

{ #category : #extending }
GTEMatrix >> expandColumns [
	self
		ensureMinimalSize: backend numberOfRows
		and: backend numberOfColumns + 1
]

{ #category : #initialization }
GTEMatrix >> initialize [
	super initialize.
	backend := Array2D rows: 0 columns: 0
]

{ #category : #accessing }
GTEMatrix >> nullifyColumn: aColumnNumber [
	backend
		atColumn: aColumnNumber
		put: (ByteArray new: backend numberOfRows)
]

{ #category : #accessing }
GTEMatrix >> nullifyRow: aRowNumber [
	backend
		atRow: aRowNumber
		put: (ByteArray new: backend numberOfColumns)
]

{ #category : #accessing }
GTEMatrix >> numberOfColumns [
	^ backend numberOfColumns
]

{ #category : #accessing }
GTEMatrix >> numberOfRows [
	^ backend numberOfRows
]

{ #category : #accessing }
GTEMatrix >> printOn: aStream [
	| reading |
	reading := backend readStream.
	[ reading atEnd ]
		whileFalse: [ aStream
				nextPutAll:( String tab join: ((reading next: backend numberOfColumns )));
				nextPutAll: String cr ]
]
