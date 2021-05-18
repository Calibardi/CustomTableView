//
//  MockDatabase.swift
//  CustomTableView
//
//  Created by Lorenzo Ilardi on 29/04/21.
//

import Foundation
import UIKit

//MARK: - Currently in use mock objects
struct ColorContainer {
	var firstContent: [ManagedColor]
	var secondContent: [ManagedColor]
	
	init(firstElem: [ManagedColor], secondElem: [ManagedColor]) {
		firstContent = firstElem
		secondContent = secondElem
	}
}

let verde = UIColor(red: 36/255, green: 212/255, blue: 134/255, alpha: 83/100)
let blu = UIColor(red: 106/255, green: 156/255, blue: 245/255, alpha: 96/100)
let fluo = UIColor(red: 180/255, green: 235/255, blue: 52/255, alpha: 92/100)
let cachi = UIColor(red: 212/255, green: 157/255, blue: 36/255, alpha: 83/100)
let rosso = UIColor(red: 247/255, green: 73/255, blue: 42/255, alpha: 97/100)
let gialloC = UIColor(red: 255/255, green: 221/255, blue: 158/255, alpha: 100/100)
let rossoC = UIColor(red: 222/255, green: 138/255, blue: 138/255, alpha: 87/100)
let violetto = UIColor(red: 186/255, green: 165/255, blue: 245/255, alpha: 96/100)
let acquamarina = UIColor(red: 138/255, green: 220/255, blue: 222/255, alpha: 87/100)
let verdeC = UIColor(red: 228/255, green: 250/255, blue: 215/255, alpha: 98/100)

let colorsArray1: [ManagedColor] = [
	ManagedColor(name: "Verde", color: verde),
	ManagedColor(name: "Blu", color: blu),
	ManagedColor(name: "Fluo", color: fluo),
	ManagedColor(name: "Cachi", color: cachi),
	ManagedColor(name: "Rosso", color: rosso)
]

let colorsArray2: [ManagedColor] = [
	ManagedColor(name: "Giallo chiaro", color: gialloC),
	ManagedColor(name: "Rosso chiaro", color: rossoC),
	ManagedColor(name: "Violetto", color: violetto),
	ManagedColor(name: "Acquamarina", color: acquamarina),
	ManagedColor(name: "Verde chiaro", color: verdeC)
]

//MARK: - Unused mock objects
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
