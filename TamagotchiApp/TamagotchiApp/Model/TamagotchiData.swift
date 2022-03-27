//
//  TamagotchiData.swift
//  TamagotchiApp
//
//  Created by Mees Rootjes on 27/03/2022.
//

import UIKit

private var collected = UserDefaults.standard.stringArray(forKey: "collected")
private var money = UserDefaults.standard.integer(forKey: "money")
private var xp = UserDefaults.standard.integer(forKey: "xp")

let tamagotchiData: [Tamagotchi] =
[Tamagotchi(
    collected:
        collected ?? [""],
    money:
        money, xp: xp
)]

private var name = UserDefaults.standard.string(forKey: "name")
private var health = UserDefaults.standard.integer(forKey: "health")
private var food = UserDefaults.standard.integer(forKey: "food")
private var attention = UserDefaults.standard.integer(forKey: "attention")
private var sleep = UserDefaults.standard.integer(forKey: "sleep")
private var status = UserDefaults.standard.string(forKey: "status")

let characterData: [Character] =
[Character(
    name:
        name ?? "",
    health:
        health,
    food:
        food,
    attention:
        attention,
    sleep:
        sleep,
    status:
        status ?? ""
)]
