//
//  Move.swift
//  SSBU Calculator
//
//  Created by Cody Olivares on 7/15/26.
//

import Foundation

struct Effect {
    let id: String
    let name: String
}

let effects: [Effect] = [
    Effect(id: "none", name: "None/Other"),
    Effect(id: "collision_attr_elec", name: "Electric"),
    Effect(id: "collision_attr_ice", name: "Freeze"),
    Effect(id: "collision_attr_sleep", name: "Sleep"),
    Effect(id: "collision_attr_bury", name: "Bury"),
    Effect(id: "collision_attr_stun", name: "Stun"),
    Effect(id: "collision_attr_paralyze", name: "Paralyze"),
    Effect(id: "collision_attr_flower", name: "Flower"),
    Effect(id: "collision_attr_bind_extra", name: "Disable")
]



struct LocalizedName: Codable {
    var en: String
    var jp: String
    
    enum CodingKeys: String, CodingKey {
        case en = "EN"
        case jp = "JP"
    }
}

struct MoveRef {
    var nameId: String
    var name: LocalizedName
    var isProjectile: Bool
    var isProjectileAttached: Bool
    var isItem: Bool
    var faf: Int
    var landingLag: Int?
    var landingLagStartFrame: Int?
    var landingLagEndFrame: Int?
    var hitboxes: [String] // Adjust type based on array contents
    var grabs: [String]    // Adjust type based on array contents
    var Throws: [String]   // Adjust type based on array contents
    var counter: String?   // Adjust type based on object schema
    var reflector: String? // Adjust type based on object schema
    var character: String
    var chargeData: String? // Adjust type based on object schema
    var type: String
    var inputType: String
    var isSmashAttack: Bool
    var isAerialAttack: Bool
    var maxSmashChargeMult: Double
}

struct BaseMove {
    var name: String
    var Article: String
    var Script: String
    var Id: Double
    var IgnoreGrabbed: Bool
    var startFrame: Int
    var endFrame: Int
    var part: Int
    var bone: String
    var damage: Double
    var angle: Int
    var kbg: Double
    var fkb: Double
    var bkb: Double
    var size: Double
    var x: Double
    var y: Double
    var z: Double
    var x2: Double
    var y2: Double
    var z2: Double
    var hitlag: Double
    var sdi: Double
    var clangRebound: String
    var facingRestrict: String
    var setWeight: Bool
    var shieldDamage: Int
    var trip: Int
    var rehit: Int
    var reflectable: Bool
    var absorbable: Bool
    var flinchless: Bool
    var disableHitlag: Bool
    var directIndirect: Bool
    var groundAir: String
    var hitbits: String
    var collisionPart: String
    var friendlyFire: Bool
    var effect: String
    var sfxLevel: String
    var sfxType: String
    var type: String
    var shieldstunMultiplier: Double
    var additionalHitstun: Int
    var moveRef: MoveRef
    var preDamage: Double
    var moveName: String
    var optionClass: [String] // Adjust type based on array contents
    var index: String
}

struct ChargeData {
    var names: [String] // Adjust type if 'names' is a single String or different object
    var min: Double     // Adjust to Int if these are always integers
    var max: Double
    var formula: (Double, Double, Double, Double, Double) -> [Double] // Adjust type if this represents a closure/function
    var label: String?  // Optional because it can be null
    
    // Memberwise initializer mirroring the JS constructor logic
    init(names: [String], min: Double, max: Double, formula: @escaping (Double, Double, Double, Double, Double) -> [Double], label: String? = nil) {
        self.names = names
        self.min = min
        self.max = max
        self.formula = formula
        self.label = label // Simplifies the JS null/presence check
    }
}

// Instance initialization examples:
// 1. Without a label (sets to nil)
let chargeItem1 = ChargeData(names: ["Charge"], min: 0, max: 60, formula: { a, b, c, d, e in
    // Example implementation; adjust as needed for real formula logic
    // Return an array based on inputs; here we just demonstrate a simple computation
    return [a * 2]
})

// 2. With a label
let chargeItem2 = ChargeData(names: ["Charge"], min: 0, max: 60, formula: { a, b, c, d, e in
    return [a * 2]
}, label: "Max Charge")

func get(list: [ChargeData], moveName: String) -> ChargeData? {
    for item in list {
        for name in item.names {
            if moveName == name {
                return item
            }
        }
    }
    return nil
}

let smashAttackCharge = ChargeData(
    names: ["Usmash", "Fsmash", "Dsmash"],
    min: 0,
    max: 60,
    formula: { baseDamage, bkb, kbg, shieldDamage, frames in
        // Returns the calculated results array matching the JS logic
        return [baseDamage * (1 + (frames * 1.4 / 150)), bkb, kbg, shieldDamage]
    }
)


// Helper function to replicate the JavaScript lerp logic used in your formulas
func lerp(_ start: Double, _ end: Double, _ frames: Double, _ maxFrames: Double) -> Double {
    return start + (end - start) * (frames / maxFrames)
}

let chargeMoves: [ChargeData] = [
    ChargeData(
        names: ["Palutena Bow", "Palutena's Bow", "Palutena's Bow (No Charge)", "Palutena's Bow (No Charge, Aerial)"],
        min: 0, max: 60,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [3.2 + (frames * 0.09), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Silver Bow", "Silver Bow (Grounded Sideways)", "Silver Bow (Grounded Upwards)", "Silver Bow (Aerial Sideways)", "Silver Bow (Aerial Upwards)"],
        min: 0, max: 60,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [5.5 + (frames * 0.1417), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Flare Blade"],
        min: 0, max: 239,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [8 + (frames * 5 / 30), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Shield Breaker"],
        min: 0, max: 60,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [base_damage * ((60 - frames) / 60 + (frames * 2.2 / 60)), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Eruption"],
        min: 0, max: 119,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [10 + (frames * 4 / 30), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Quickdraw (Attack)"],
        min: 0, max: 70,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [base_damage + (frames * 0.1), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Giant Punch (Uncharged"],
        min: 0, max: 9,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            var f = frames
            if f == 1 {
                f = 0
            }
            return [base_damage + (2 * f), bkb, kbg, shieldDamage]
        },
        label: "Arm swings"
    ),
    ChargeData(
        names: ["Charge Shot", "Charge Shot (Grounded)", "Charge Shot (Aerial)"],
        min: 0, max: 112,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(5, 28, frames, 112), lerp(14, 46, frames, 112), lerp(42, 50, frames, 112), lerp(-2.5, -7, frames, 112)]
        }
    ),
    ChargeData(
        names: ["Charge Blast (No Charge)"],
        min: 0, max: 119,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(base_damage, 22, frames, 120), lerp(bkb, 20, frames, 120), lerp(kbg, 64, frames, 120), shieldDamage]
        }
    ),
    ChargeData(
        names: ["Hero's Bow (No Charge)"],
        min: 0, max: 60,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [4 + (12 - 4) * (frames / 60), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Spin Attack (No Charge,"],
        min: 0, max: 60,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [base_damage * ((60 - frames) / 60 + (frames * 1.6 / 60)), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["PK Flash (No Charge)", "PK Trash (No Charge)"],
        min: 0, max: 105,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [5 + (((frames + 15) / 120) * 0.32 * 100), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Dragon Fang Shot (Bite, No Charge)"],
        min: 0, max: 30,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(10, 18, frames, 30), 50, 100, 3]
        }
    ),
    ChargeData(
        names: ["Dragon Fang Shot (Shot, No Charge)"],
        min: 0, max: 29,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(4, 9, frames, 30), lerp(20, 30, frames, 30), kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Aura Sphere (Release from Charge)"],
        min: 0, max: 89,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(10, 25, frames, 90) * 0.69, lerp(bkb, 35, frames, 90), lerp(kbg, 69, frames, 90), lerp(shieldDamage, -3, frames, 90)]
        }
    ),
    ChargeData(
        names: ["Skull Bash"],
        min: 0, max: 90,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(base_damage, 21.4, frames, 90), bkb, kbg, shieldDamage]
        }
    ),
    ChargeData(
        names: ["Rollout (Ground, Release)", "Rollout (Aerial, Release)"],
        min: 0, max: 6.5,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            if frames < 2 {
                return [7, bkb]
            }
            return [max(floor(frames * 1.5 * 3.4), 1), bkb, kbg, shieldDamage]
        },
        label: "Current speed"
    ),
    ChargeData(
        names: ["Water Shuriken (Uncharged)"],
        min: 0, max: 39,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(3, 11, frames, 40), lerp(10, 20, frames, 40), lerp(45, 85, frames, 40), lerp(-1.5, -5.5, frames, 40)]
        }
    ),
    ChargeData(
        names: ["Sun Salutation"],
        min: 0, max: 85,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(5, 21, frames, 85), 30, 63, lerp(-2.5, -5.3, frames, 85)]
        }
    ),
    ChargeData(
        names: ["Shadow Ball"],
        min: 0, max: 119,
        formula: { base_damage, bkb, kbg, shieldDamage, frames in
            return [lerp(2.5, 25, frames, 120), lerp(bkb, 30, frames, 120), lerp(kbg, 67, frames, 120), lerp(shieldDamage, -4, frames, 120)]
        }
    )
]



// Placeholder/Helper types mirroring your previous models
struct MoveType {
    var type: String
    var inputType: String
    var isSmashAttack: Bool
    var isAerialAttack: Bool
}

class localizedName {
    var en: String
    var jp: String
    init(en: String, jp: String) { self.en = en; self.jp = jp }
}

class Hitbox {
    var id: String = ""
    var startFrame: Int = 0
    var damage: Double = 0.0
    var bkb: Double = 0.0
    var kbg: Double = 0.0
    var shieldDamage: Int = 0
    var groundAir: String = ""
    var effect: String = ""
    var ignoreGrabbed: Bool = false
    
    // Properties initialized/mutated dynamically by MoveData
    weak var moveRef: MoveData?
    var preDamage: Double = 0.0
    var moveName: String = ""
    var optionClass: [String] = []
    
    // Backup fields matching JS prepended underscores
    var originalDamage: Double = 0.0
    var originalBKB: Double = 0.0
    var originalKBG: Double = 0.0
    var originalShieldDamage: Int = 0
    
    // Custom charge behaviors
    var chargeData: ChargeData?
    
    func chargeDamage(frames: Double) -> Double {
        guard let formula = chargeData?.formula else { return originalDamage }
        let result = formula(originalDamage, originalBKB, originalKBG, Double(originalShieldDamage), frames)[0]
        // Formats to 4 decimal places safely in Swift
        return Double(String(format: "%.4f", result)) ?? result
    }
    
    func chargeBKB(frames: Double) -> Double {
        return chargeData?.formula(originalDamage, originalBKB, originalKBG, Double(originalShieldDamage), frames)[1] ?? originalBKB
    }
    
    func chargeKBG(frames: Double) -> Double {
        return chargeData?.formula(originalDamage, originalBKB, originalKBG, Double(originalShieldDamage), frames)[2] ?? originalKBG
    }
    
    func chargeShieldDamage(frames: Double) -> Double {
        return chargeData?.formula(originalDamage, originalBKB, originalKBG, Double(originalShieldDamage), frames)[3] ?? Double(originalShieldDamage)
    }
}

class Throw {
    var id: String = ""
    var kind: String = ""
    var appliedFrame: Int = 0
    var damage: Double = 0.0
    
    // Mutated fields
    weak var moveRef: MoveData?
    var preDamage: Double = 0.0
    var isThrow: Bool = false
    var startFrame: Int = 0
    var endFrame: Int = 0
    var setWeight: Bool = false
    var disableHitlag: Bool = false
    var shieldDamage: Int? = nil
    var shieldstunMultiplier: Double = 1.0
    var additionalHitstun: Int = 0
    var moveName: String = ""
    var optionClasses: String = ""
}

/// Computes Smash Attack damage scaling based on charge frames.
/// - Parameters:
///   - baseDamage: The uncharged base damage.
///   - chargeFrames: Number of frames the move has been charged.
///   - isMegaManFsmash: Special-case flag for Mega Man's Fsmash which caps lower.
///   - witchTimeActive: Special-case flag for Bayonetta's Witch Time interaction.
///   - maxSmashChargeMult: Maximum damage multiplier for this move/character.
/// - Returns: The charged damage value.
func chargeSmash(
    baseDamage: Double,
    chargeFrames: Double,
    isMegaManFsmash: Bool,
    witchTimeActive: Bool,
    maxSmashChargeMult: Double
) -> Double {
    // Standard Ultimate behavior approaches up to ~1.4x at full charge over ~60 frames.
    // We respect the provided maxSmashChargeMult and special cases.
    let maxFrames: Double = 60
    let clampedFrames = max(0, min(chargeFrames, maxFrames))

    // Base scaling up to the given max multiplier
    let baseMaxMult = maxSmashChargeMult
    let mult = 1.0 + (baseMaxMult - 1.0) * (clampedFrames / maxFrames)

    // Mega Man Fsmash has a lower cap in some rulesets; if flagged, clamp to 1.2
    let megaManCap = isMegaManFsmash ? min(baseMaxMult, 1.2) : baseMaxMult
    let megaManMult = min(mult, megaManCap)

    // Bayonetta Witch Time: if active, reduce effective scaling slightly (example: 5% reduction)
    let witchTimeFactor = witchTimeActive ? 0.95 : 1.0
    let finalMult = megaManMult * witchTimeFactor

    return baseDamage * finalMult
}

class MoveData {
    var character: String
    var name: LocalizedName
    var type: String
    var inputType: String
    var isSmashAttack: Bool
    var isAerialAttack: Bool
    var isFromUltimateHitboxes: Bool
    var smashAttack: Bool = false // Mapping JS `this.smash_attack`
    
    var chargeData: ChargeData?
    var maxSmashChargeMult: Double = 1.0
    
    var hitboxes: [Hitbox] = []
    var throws: [Throw] = []
    var grabs: [String] = [] // Explicitly ignored per comments
    
    init(character: String, name: LocalizedName, hitboxes: [Hitbox], throwsList: [Throw], moveType: MoveType, ultHitboxes: Bool = false, smashAttack: Bool = false) {
        self.character = character
        self.name = name
        self.hitboxes = hitboxes
        self.throws = throwsList
        self.smashAttack = smashAttack
        
        self.type = moveType.type
        self.inputType = moveType.inputType
        self.isSmashAttack = moveType.isSmashAttack
        self.isAerialAttack = moveType.isAerialAttack
        self.isFromUltimateHitboxes = ultHitboxes
        
        // 1. Resolve Charge Data
        // Assumes `ChargeData.get` static helper from previous step
        if let charge = ChargeData.get(list: chargeMoves, moveName: self.name.en) {
            self.chargeData = charge
        }
        
        // 2. Smash Attack Multiplier Logic
        self.maxSmashChargeMult = self.smashAttack ? 1.4 : 1.0
        if self.isSmashAttack {
            if self.character == "Bayonetta" || self.character == "Olimar" {
                self.maxSmashChargeMult = 1.2
            }
            if self.character == "Ness" && (self.name.en.contains("Usmash") || self.name.en.contains("Dsmash")) {
                self.maxSmashChargeMult = 1.2
            }
            if (self.character == "Mega Man" || self.character == "Villager") && self.name.en.contains("Fsmash") {
                self.maxSmashChargeMult = 1.2
            }
        }
        
        // 3. Process Hitbox Frame and ID Alignment Analysis
        var sameFrame = true
        var frame = 0
        var sameId = true
        var hId = ""
        
        if self.hitboxes.count > 1 {
            frame = self.hitboxes[0].startFrame
            hId = self.hitboxes[0].id
            
            for i in 1..<self.hitboxes.count {
                if frame != self.hitboxes[i].startFrame {
                    sameFrame = false
                }
                if hId != self.hitboxes[i].id {
                    sameId = false
                }
            }
        }
        
        // 4. Mutate Hitbox Objects
        for hitbox in self.hitboxes {
            hitbox.moveRef = self
            hitbox.preDamage = 0.0
            hitbox.moveName = self.name.en
            
            hitbox.originalDamage = hitbox.damage
            hitbox.originalBKB = hitbox.bkb
            hitbox.originalKBG = hitbox.kbg
            hitbox.originalShieldDamage = hitbox.shieldDamage
            
            if self.inputType == "throw" {
                hitbox.moveName += " (Collateral)"
            }
            
            var parsedId = hitbox.id
            if let numericId = Int(hitbox.id) {
                parsedId = String(numericId + 1)
            }
            
            if self.hitboxes.count > 1 {
                if sameFrame {
                    hitbox.moveName += " (Hitbox \(parsedId))"
                } else {
                    if sameId {
                        hitbox.moveName += " (Frame \(hitbox.startFrame))"
                    } else {
                        hitbox.moveName += " (Frame \(hitbox.startFrame) / Hitbox \(parsedId))"
                    }
                }
            }
            
            hitbox.optionClass = []
            if hitbox.groundAir == "COLLISION_SITUATION_MASK_G" {
                hitbox.optionClass.append("groundOnly")
            } else if hitbox.groundAir == "COLLISION_SITUATION_MASK_A" {
                hitbox.optionClass.append("aerialOnly")
            }
            
            if let charge = self.chargeData {
                hitbox.chargeData = charge
            }
        }
        
        // 5. Process Throw Uniformity Analysis
        var sameKind = true
        var kind = ""
        
        if self.throws.count > 1 {
            kind = self.throws[0].kind
            for i in 1..<self.throws.count {
                if kind != self.throws[i].kind {
                    sameKind = false
                    break
                }
            }
        }
        
        // 6. Mutate Throw Objects
        for t in self.throws {
            t.moveRef = self
            t.preDamage = 0.0
            t.isThrow = true
            
            t.startFrame = t.appliedFrame
            t.endFrame = t.appliedFrame + 1
            t.setWeight = false
            t.disableHitlag = false
            t.shieldDamage = nil
            t.shieldstunMultiplier = 1.0
            t.additionalHitstun = 0
            
            // Pre-damage calculations matching frames layout
            for hitbox in self.hitboxes {
                if !hitbox.ignoreGrabbed && !ultHitboxes {
                    if hitbox.startFrame < t.appliedFrame && hitbox.id == "0" {
                        t.preDamage += hitbox.damage
                    }
                }
            }
            
            t.moveName = self.name.en
            
            if sameKind && self.throws.count > 1 {
                let currentId = Int(t.id) ?? 0
                if !self.hitboxes.isEmpty {
                    t.moveName += " (Throw, Id \(currentId + 1))"
                } else {
                    t.moveName += " (Id \(currentId + 1))"
                }
            } else {
                if !self.hitboxes.isEmpty {
                    t.moveName += " (Throw)"
                }
            }
            
            t.optionClasses = ""
        }
    }
    
    // Filter functions replacing JS anonymous filtering structures
    func getHitboxes() -> [Hitbox] {
        return self.hitboxes.filter { $0.effect != "collision_attr_search" }
    }
    
    func getThrows() -> [Throw] {
        return self.throws.filter { $0.kind != "FIGHTER_ATTACK_ABSOLUTE_KIND_CATCH" || $0.id != "0" }
    }
}




class Move {
    // Contains all fields from baseMove
    var baseMoveData: BaseMove
    
    // Explicitly tracked index string
    var index: String
    
    // Initializer matching the JS constructor logic
    init(index: Int, data: BaseMove? = nil) {
        // Fallback to a global 'baseMove' instance if data is nil
        let d = data ?? globalBaseMove
        
        self.baseMoveData = d
        self.index = String(index)
    }
    
    // Updates internal attributes based on charge frame metrics
    func applyCharge(chargeFrames: Double, witchTimeActive: Bool = false) {
        // 1. Process custom charge data formulas if present
        if baseMoveData.moveRef.chargeData != nil {
            // Evaluates charge functions (assuming helper calculation methods exist)
            baseMoveData.damage = self.chargeDamage(chargeFrames)
            baseMoveData.bkb = self.chargeBkb(chargeFrames)
            baseMoveData.kbg = self.chargeKbg(chargeFrames)
            baseMoveData.shieldDamage = Int(self.chargeShieldDamage(chargeFrames))
        }
        
        // Assuming ChargeSmash is a global helper function
        // 2. Process global Smash Attack charge modifications
        if baseMoveData.moveRef.isSmashAttack {
            let isMegaManFsmash = (baseMoveData.moveRef.character == "Mega Man" && baseMoveData.moveRef.nameId == "Fsmash")
            let isBayonettaWitchTime = (baseMoveData.moveRef.character == "Bayonetta") ? witchTimeActive : false
            
            // Assuming ChargeSmash is a global helper function
            baseMoveData.damage = chargeSmash(
                baseDamage: baseMoveData.damage, // Using fallback original value tracking if needed
                chargeFrames: chargeFrames,
                isMegaManFsmash: isMegaManFsmash,
                witchTimeActive: isBayonettaWitchTime,
                maxSmashChargeMult: baseMoveData.moveRef.maxSmashChargeMult
            )
        }
    }
    
    // Placeholder calculation helpers mirroring your formula calls
    private func chargeDamage(_ frames: Double) -> Double { return 0.0 }
    private func chargeBkb(_ frames: Double) -> Double { return 0.0 }
    private func chargeKbg(_ frames: Double) -> Double { return 0.0 }
    private func chargeShieldDamage(_ frames: Double) -> Double { return 0.0 }
}

