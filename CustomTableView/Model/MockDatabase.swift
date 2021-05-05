//
//  MockDatabase.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 29/04/21.
//

import Foundation

class Beer: ManagedObject {
}

class Gin: ManagedObject {	
}

let beersArray = [
    Beer(title: "Leffe", imageName: "leffe", header2: "6.5%"),
    Beer(title: "Delirium Tremens", imageName: "delirium", header2: "9%"),
    Beer(title: "Spitfire", imageName: "spitfire", header2: "6.5%"),
    Beer(title: "Lupulus", imageName: "lupulus", header2: "8.5%")
]

let ginArray = [
	Gin(title: "Gin del professore", imageName: "gindelprof", header2: "43.7%"),
	Gin(title: "Gin Mare", imageName: "ginmare", header2: "42.7%"),
	Gin(title: "Tanqueray", imageName: "tanquerai", header2: "43.1%"),
	Gin(title: "Monkey 47 Sloe", imageName: "monkey47", header2: "29%")
]

///Classe da inizializzare e passare alla `CustomTableView`, contiene due array di `ManagedObject`
struct Container {
	
	var firstContent: [ManagedObject]
	var secondContent: [ManagedObject]
	
	///Inizializza `Container` con due array, che verranno rappresentati rispettivamente
	///nella prima cella della prima sezione della tableView e nella prima cella della seconda sezione della tableView
	init(firstArray: [ManagedObject], secondArray: [ManagedObject]) {
		firstContent = firstArray
		secondContent = secondArray
	}
}
