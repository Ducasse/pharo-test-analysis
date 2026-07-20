Class {
	#name : 'SimpleNoAssertVisitor',
	#superclass : 'RTDMethodVisitor',
	#instVars : [
		'containAssertMessagNode',
		'assertselectors'
	],
	#category : 'RottenTestsDebugger-visitors',
	#package : 'RottenTestsDebugger',
	#tag : 'visitors'
}

{ #category : 'accessing' }
SimpleNoAssertVisitor >> containAssertMessagNode [

	^ containAssertMessagNode
]

{ #category : 'visiting' }
SimpleNoAssertVisitor >> containsAssertMessageNode: aBoolean [

	containAssertMessagNode := aBoolean
]

{ #category : 'initialization' }
SimpleNoAssertVisitor >> initialize [ 
	super initialize .
	containAssertMessagNode:= false.
	assertselectors := { #assert . #deny }
]

{ #category : 'visiting' }
SimpleNoAssertVisitor >> visitMessageNode: aMessageNode [

	self visitNodes: aMessageNode.
	containAssertMessagNode := containAssertMessagNode or: [ aMessageNode selector beginsWithAnyOf: assertselectors ]
	"dans le cas d'un self guetter on renvoit true même sans assert et assert fonctionne aussi sur n'importe quel objet"
	
]
