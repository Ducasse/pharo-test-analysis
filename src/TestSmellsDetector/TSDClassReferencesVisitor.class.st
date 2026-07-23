"
I count everytime a class (global variable) has been referenced in a method statically, traversing through self calls
"
Class {
	#name : 'TSDClassReferencesVisitor',
	#superclass : 'RTFSelfCallVisitorInterpreter',
	#instVars : [
		'classReferences',
		'found'
	],
	#category : 'TestSmellsDetector-Visitors',
	#package : 'TestSmellsDetector',
	#tag : 'Visitors'
}

{ #category : 'api' }
TSDClassReferencesVisitor >> anyClassIsReferencedMoreThan: aNumber [

	^ self classReferences anySatisfy: [ :class | (self referencesOf: class) >= aNumber ]
]

{ #category : 'visiting' }
TSDClassReferencesVisitor >> classReferences [

	^ classReferences ifNil: [ classReferences := Bag new ]
]

{ #category : 'visiting' }
TSDClassReferencesVisitor >> containsAssertMessageNode: aBoolean [ 
	found:= aBoolean .
]

{ #category : 'api' }
TSDClassReferencesVisitor >> referencesCount [

	^ self classReferences asSet size
]

{ #category : 'private' }
TSDClassReferencesVisitor >> referencesOf: aClass [

	^ self classReferences occurrencesOf: aClass 
]

{ #category : 'api' }
TSDClassReferencesVisitor >> reset [ 

	classReferences := nil.
	^ super reset
]

{ #category : 'visiting' }
TSDClassReferencesVisitor >> visitVariableNode: aVariableNode [

	aVariableNode isGlobalVariable ifTrue: [ self classReferences add: aVariableNode variable value ].
	super visitVariableNode: aVariableNode "pourquoi cette ligne"
]
