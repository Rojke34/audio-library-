//
//  ViewController.swift
//  AudioGameLibrary
//
//  Created by Kevin Rojas on 12/29/17.
//  Copyright © 2017 Kevin Rojas. All rights reserved.
//
// x: 207
// y: 368
//
// w: 58:414
// h: 58:736

import UIKit
import SwiftySound

class ViewController: UIViewController {
    @IBOutlet weak var labelPercentageVolume: UILabel!
    @IBOutlet weak var switchSoundEnabled: UISwitch!
    @IBOutlet weak var sliderUI: UISlider!
    
    private var bsoSound: Sound?
    
    private var abominationEffect: Sound?
    private var nearZombie: Sound?
    private var necromancer: Sound?
    
    private var flame: Sound?
    private var youDiedEffec: Sound?
    private var crackDoorEffec: Sound?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchSoundEnabled.isOn = Sound.enabled
        
        Sound.category = .playback
        
        if let bsoUrl = Bundle.main.url(forResource: "Varios/Others_sounds/Ambient_One", withExtension: "mp3") {
            bsoSound = Sound(url: bsoUrl)
        }
        
        if let abominationUrl = Bundle.main.url(forResource: "Varios/Zombie_sounds/Abomination", withExtension: "mp3") {
            abominationEffect = Sound(url: abominationUrl)
        }
        
        if let nearZombieUrl = Bundle.main.url(forResource: "Varios/Zombie_sounds/Close_Zombie", withExtension: "mp3") {
            nearZombie = Sound(url: nearZombieUrl)
        }
        
        if let necromancerUrl = Bundle.main.url(forResource: "Varios/Zombie_sounds/Necromancer", withExtension: "mp3") {
            necromancer = Sound(url: necromancerUrl)
        }
        
        
        
        if let flameUrl = Bundle.main.url(forResource: "Varios/Others_sounds/Explosion", withExtension: "mp3") {
            flame = Sound(url: flameUrl)
        }
        
        if let youDiedEffecUrl = Bundle.main.url(forResource: "Varios/Others_sounds/Survivor_Death_By_Zombie", withExtension: "mp3") {
            youDiedEffec = Sound(url: youDiedEffecUrl)
        }
        
        if let crackDoorEffecUrl = Bundle.main.url(forResource: "Varios/Others_sounds/Crack_Door", withExtension: "mp3") {
            crackDoorEffec = Sound(url: crackDoorEffecUrl)
        }
        
    }

    private func numberOfLoops() -> Int {
        return 0
    }

    @IBAction func BSOButtonDidTouch(_ sender: Any) {
        bsoSound?.play(numberOfLoops: -1, completion: { (completed) in
            print("completed: \(completed)")
        })
    }
    
    func ceroBSO() {
        bsoSound?.volume = 0.1
        labelPercentageVolume.text = "\(String(format: "%0.0f", (0.1 * 100)))%"
        sliderUI.value = 0.1
    }
    
    func onehundredBSO() {
        self.sliderUI.value = 1
        self.bsoSound?.volume = 1
        self.labelPercentageVolume.text = "\(String(format: "%0.0f", (1.0 * 100)))%"
    }
    
    @IBAction func characterButtonDidTouch(_ sender: UIButton) {
        ceroBSO()
        
        switch sender.tag {
        case 1:
            abominationEffect?.play(numberOfLoops: 0, completion: { (completed) in
                self.onehundredBSO()
            })
            print("character button 1 did touch")
        case 2:
            nearZombie?.play(numberOfLoops: 2, completion: { (completed) in
                self.onehundredBSO()
            })
            print("character button 2 did touch")
        case 3:
            necromancer?.play(numberOfLoops: 1, completion: { (completed) in
                self.onehundredBSO()
            })
            print("character button 3 did touch")
        default:
            print("default")
        }
    }
    
    @IBAction func actionButtonDidTouch(_ sender: Any) {
        ceroBSO()
        flame?.play(numberOfLoops: 0, completion: { (completed) in
            self.onehundredBSO()
        })
        
    }
    
    @IBAction func youDiedButtonDidTouch(_ sender: Any) {
        ceroBSO()
        youDiedEffec?.play(numberOfLoops: 0, completion: { (completed) in
            self.onehundredBSO()
        })
    }
    
    @IBAction func crackDoorButtonDidTouch(_ sender: Any) {
        ceroBSO()
        crackDoorEffec?.play(numberOfLoops: 1, completion: { (completed) in
            self.onehundredBSO()
        })
    }
    
    @IBAction func sliderVolumeValueChanged(_ sender: UISlider) {
        bsoSound?.volume = sender.value
        labelPercentageVolume.text = "\(String(format: "%0.0f", (sender.value * 100)))%"
    }
    
    @IBAction func switchSoundEnabledValueChanged(_ sender: UISwitch) {
        Sound.enabled = sender.isOn
    }
    
    
    var effect: Sound?
    
    //Mark: Effect
    @IBAction func effectButtonDidTouch(_ sender: UIButton) {
        var effectName: String = ""
        var effectExt: String = ""
        
        switch sender.tag {
        case 1:
            effectName = "Effects/Death_Strike"
            effectExt = "mp3"
            print("character button 1 did touch")
        case 2:
            effectName = "Effects/Healing"
            effectExt = "mp3"
            print("character button 2 did touch")
        case 3:
            effectName = "Effects/Invisibility"
            effectExt = "mp3"
            print("character button 3 did touch")
        case 4:
            effectName = "Effects/Lightning_Bolt"
            effectExt = "mp3"
            print("character button 4 did touch")
        case 5:
            effectName = "Effects/Mana_Blast"
            effectExt = "mp3"
            print("character button 5 did touch")
        case 6:
            effectName = "Effects/Repulse"
            effectExt = "mp3"
            print("character button 6 did touch")
        case 7:
            effectName = "Effects/Speed"
            effectExt = "mp3"
            print("character button 7 did touch")
        case 8:
            effectName = "Effects/Fireball"
            effectExt = "wav"
            print("character button 8 did touch")
        case 9:
            effectName = "Effects/Inferno"
            effectExt = "wav"
            print("character button 9 did touch")
        default:
            print("default")
        }
        
        
//        Sound.play(file: effectName, fileExtension: "mp3", numberOfLoops: 0)
        
        if let effectURL = Bundle.main.url(forResource: effectName, withExtension: effectExt) {
            effect = Sound(url: effectURL)
        }
        
        ceroBSO()
        effect?.play(numberOfLoops: 0, completion: { (completed) in
            self.onehundredBSO()
        })
        
    }
    
    var meleeEffect: Sound?
    @IBAction func MelleButtonsDidTouch(_ sender: UIButton) {
        var effectName: String = ""
        
        
        switch sender.tag {
        case 1:
            effectName = "Varios/Melee_sounds/Axe"
            print("character button 1 did touch")
        case 2:
            effectName = "Varios/Melee_sounds/Bow"
            print("character button 2 did touch")
        case 3:
            effectName = "Varios/Melee_sounds/Crossbow"
            print("character button 3 did touch")
        case 4:
            effectName = "Varios/Melee_sounds/Dagger"
            print("character button 4 did touch")
        case 5:
            effectName = "Varios/Melee_sounds/Hammer"
            print("character button 5 did touch")
        case 6:
            effectName = "Varios/Melee_sounds/Shield"
            print("character button 6 did touch")
        case 7:
            effectName = "Varios/Melee_sounds/Sword"
            print("character button 7 did touch")
        case 8:
            effectName = "Varios/Melee_sounds/Torch"
            print("character button 8 did touch")
        default:
            print("default")
        }
        
        if let effectURL = Bundle.main.url(forResource: effectName, withExtension: "mp3") {
            meleeEffect = Sound(url: effectURL)
        }
        
        ceroBSO()
        meleeEffect?.play(numberOfLoops: 0, completion: { (completed) in
            self.onehundredBSO()
        })
    }
    
}

