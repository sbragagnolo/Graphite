Class {
	#name : #BaselineOfGraphite,
	#superclass : #BaselineOf,
	#category : #BaselineOfGraphite
}

{ #category : #baselines }
BaselineOfGraphite >> baseline: spec [
	<baseline> 
	
	spec baseline: #Equals with: [ spec repository: 'github://bouraqadi/PharoMisc' ].
	spec package: #Graphite with: [  spec  requires: #Equals ].
	
	spec group: #minimum with: #(#Graphite) 
]
