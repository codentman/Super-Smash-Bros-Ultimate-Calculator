    //
    //  Character.swift
    //  SSBU Calculator
    //
    //  Created by Cody Olivares on 7/15/26.
    //
import Foundation

    struct Characters {
        var characters = ["Mario", "Luigi", "Peach", "Bowser", "Yoshi", "Rosalina And Luma", "Bowser Jr", "Wario", "Donkey Kong", "Diddy Kong", "Game And Watch", "Little Mac", "Link", "Zelda", "Sheik", "Ganondorf", "Toon Link", "Samus", "Zero Suit Samus", "Pit", "Palutena", "Marth", "Ike", "Robin", "Duck Hunt", "Kirby", "King Dedede", "Meta Knight", "Fox", "Falco", "Pikachu", "Charizard", "Lucario", "Jigglypuff", "Greninja", "R.O.B", "Ness", "Captain Falcon", "Villager", "Olimar", "Wii Fit Trainer", "Shulk", "Dr. Mario", "Dark Pit", "Lucina", "PAC-MAN", "Mega Man", "Sonic", "Mewtwo", "Lucas", "Roy", "Ryu", "Cloud", "Corrin", "Bayonetta", "Mii Swordfighter", "Mii Brawler", "Mii Gunner", "Ice Climbers", "Pichu", "Young Link", "Snake", "Squirtle", "Ivysaur", "Wolf", "Inkling", "Daisy", "Ridley", "Chrom", "Dark Samus", "Simon", "Richter", "King K. Rool", "Isabelle", "Ken", "Incineroar", "Piranha Plant", "Joker", "Hero", "Banjo & Kazooie", "Terry", "Byleth", "Min Min", "Steve", "Sephiroth", "Pyra", "Mythra", "Kazuya", "Sora"];
        var displayNames = ["Mario", "Luigi", "Peach", "Bowser", "Yoshi", "Rosalina And Luma", "Bowser Jr", "Wario", "Donkey Kong", "Diddy Kong", "Game And Watch", "Little Mac", "Link", "Zelda", "Sheik", "Ganondorf", "Toon Link", "Samus", "Zero Suit Samus", "Pit", "Palutena", "Marth", "Ike", "Robin", "Duck Hunt", "Kirby", "King Dedede", "Meta Knight", "Fox", "Falco", "Pikachu", "Charizard", "Lucario", "Jigglypuff", "Greninja", "R.O.B", "Ness", "Captain Falcon", "Villager", "Olimar", "Wii Fit Trainer", "Shulk", "Dr. Mario", "Dark Pit", "Lucina", "PAC-MAN", "Mega Man", "Sonic", "Mewtwo", "Lucas", "Roy", "Ryu", "Cloud", "Corrin", "Bayonetta", "Mii Swordfighter", "Mii Brawler", "Mii Gunner", "Ice Climbers", "Pichu", "Young Link", "Snake", "Squirtle", "Ivysaur", "Wolf", "Inkling", "Daisy", "Ridley", "Chrom", "Dark Samus", "Simon", "Richter", "King K. Rool", "Isabelle", "Ken", "Incineroar", "Piranha Plant", "Joker", "Hero", "Banjo & Kazooie", "Terry", "Byleth", "Min Min", "Steve", "Sephiroth", "Pyra", "Mythra", "Kazuya", "Sora"];
        var KHcharacters = ["Mario", "Luigi", "Peach", "Bowser", "Yoshi", "Rosalina And Luma", "Bowser Jr", "Wario", "Donkey Kong", "Diddy Kong", "Game And Watch", "Little Mac", "Link", "Zelda", "Sheik", "Ganondorf", "Toon Link", "Samus", "Zero Suit Samus", "Pit", "Palutena", "Marth", "Ike", "Robin", "Duck Hunt", "Kirby", "King Dedede", "Meta Knight", "Fox", "Falco", "Pikachu", "Charizard", "Lucario", "Jigglypuff", "Greninja", "R.O.B", "Ness", "Captain Falcon", "Villager", "Olimar", "Wii Fit Trainer", "Shulk", "Dr. Mario", "Dark Pit", "Lucina", "PAC-MAN", "Mega Man", "Sonic", "Mewtwo", "Lucas", "Roy", "Ryu", "Cloud", "Corrin", "Bayonetta", "Mii Swordfighter", "Mii Brawler", "Mii Gunner", "Ice Climbers", "Pichu", "Young Link", "Snake", "Squirtle", "Ivysaur", "Wolf", "Inkling", "Daisy", "Ridley", "Chrom", "Dark Samus", "Simon", "Richter", "King K. Rool", "Isabelle", "Ken", "Incineroar", "Piranha Plant", "Joker", "Hero", "Banjo & Kazooie", "Terry", "Byleth", "Min Min", "Steve", "Sephiroth", "Pyra", "Mythra", "Kazuya", "Sora"];
        var dataViewerNames = ["Mario", "Luigi", "Peach", "Bowser", "Yoshi", "Rosalina And Luma", "Bowser Jr", "Wario", "Donkey Kong", "Diddy Kong", "Game And Watch", "Little Mac", "Link", "Zelda", "Sheik", "Ganondorf", "Toon Link", "Samus", "Zero Suit Samus", "Pit", "Palutena", "Marth", "Ike", "Robin", "Duck Hunt", "Kirby", "King Dedede", "Meta Knight", "Fox", "Falco", "Pikachu", "Charizard", "Lucario", "Jigglypuff", "Greninja", "R.O.B", "Ness", "Captain Falcon", "Villager", "Olimar", "Wii Fit Trainer", "Shulk", "Dr. Mario", "Dark Pit", "Lucina", "PAC-MAN", "Mega Man", "Sonic", "Mewtwo", "Lucas", "Roy", "Ryu", "Cloud", "Corrin", "Bayonetta", "Mii Swordfighter", "Mii Brawler", "Mii Gunner", "Ice Climbers", "Pichu", "Young Link", "Snake", "Squirtle", "Ivysaur", "Wolf", "Inkling", "Daisy", "Ridley", "Chrom", "Dark Samus", "Simon", "Richter", "King K. Rool", "Isabelle", "Ken", "Incineroar", "Piranha Plant", "Joker", "Hero", "Banjo & Kazooie", "Terry", "Byleth", "Min Min", "Steve", "Sephiroth", "Pyra", "Mythra", "Kazuya", "Sora"];
        var ultHitboxesFilenames = ["01_mario", "09_luigi", "13_peach", "14_bowser", "05_yoshi", "48_rosalina-luma", "58_bowser-jr", "30_wario", "02_donkey-kong", "36_diddy-kong", "26_mr-game-watch", "49_little-mac", "03_link", "17_zelda", "16_sheik", "23_ganondorf", "43_toon-link", "04_samus", "29_zero-suit-samus", "28_pit", "54_palutena", "21_marth", "32_ike", "56_robin", "59_duck-hunt", "06_kirby", "39_king-dedede", "27_meta-knight", "07_fox", "20_falco", "08_pikachu", "35_charizard", "41_lucario", "12_jigglypuff", "50_greninja", "42_rob", "10_ness", "11_captain-falcon", "45_villager", "40_olimar", "47_wii-fit-trainer", "57_shulk", "18_dr-mario", "28e_dark-pit", "21e_lucina", "55_pac-man", "46_mega-man", "38_sonic", "24_mewtwo", "37_lucas", "25_roy", "60_ryu", "61_cloud", "62_corrin", "63_bayonetta", "52_mii-swordfighter", "51_mii-brawler", "53_mii-gunner", "15_ice-climbers", "19_pichu", "22_young-link", "31_snake", "33_squirtle", "34_ivysaur", "44_wolf", "64_inkling", "13e_daisy", "65_ridley", "25e_chrom", "04e_dark-samus", "66_simon", "66e_richter", "67_king-k-rool", "68_isabelle", "60e_ken", "69_incineroar", "70_piranha-plant", "71_joker", "72_hero", "73_banjo-kazooie", "74_terry", "75_byleth", "76_min-min", "77_steve", "78_sephiroth", "79_pyra", "80_mythra", "81_kazuya", "82_sora"];
    }


class AttributeModifier {
    // Properties
    var name: String
    var baseDamageMultiplier: Double
    var damageDealtMultiplier: Double
    var damageReceivedMultiplier: Double
    var kbDealtMultiplier: Double
    var kbReceivedMultiplier: Double
    var gravityMultiplier: Double
    var fallSpeedMultiplier: Double
    var shieldHPMultiplier: Double
    var airFrictionMultiplier: Double
    var groundFrictionMultiplier: Double
    
    var targetListVisible: Bool = true
    var attackerListVisible: Bool = true
    var shieldDamage: Double

    // Initializer
    init(
        name: String,
        baseDamage: Double,
        damageDealt: Double,
        damageTaken: Double,
        kbDealt: Double,
        kbReceived: Double,
        gravity: Double,
        fallSpeed: Double,
        shield: Double,
        airFriction: Double,
        traction: Double,
        shieldDamage: Double? = nil // Optional to handle 'undefined'
    ) {
        self.name = name
        self.baseDamageMultiplier = baseDamage
        self.damageDealtMultiplier = damageDealt
        self.damageReceivedMultiplier = damageTaken
        self.kbDealtMultiplier = kbDealt
        self.kbReceivedMultiplier = kbReceived
        self.gravityMultiplier = gravity
        self.fallSpeedMultiplier = fallSpeed
        self.shieldHPMultiplier = shield
        self.airFrictionMultiplier = airFriction
        self.groundFrictionMultiplier = traction
        
        // Handle undefined/nil default logic
        self.shieldDamage = shieldDamage ?? 1.0

        // Conditional visibility logic
        if self.name != "Normal" && !self.name.hasPrefix("Luma") &&
           (self.baseDamageMultiplier == 1.0 && self.damageDealtMultiplier == 1.0 && self.kbDealtMultiplier == 1.0) {
            self.attackerListVisible = false
        }

        if self.name != "Normal" && !self.name.hasPrefix("Luma") &&
           (self.damageReceivedMultiplier == 1.0 && self.kbReceivedMultiplier == 1.0 &&
            self.gravityMultiplier == 1.0 && self.fallSpeedMultiplier == 1.0 &&
            self.shieldHPMultiplier == 1.0 && self.groundFrictionMultiplier == 1.0) {
            self.targetListVisible = false
        }
    }
}

// Alternative AttributeModifier implementation (removed for clarity)
    
var monado = [
    AttributeModifier(name: "Jump", baseDamage: 1, damageDealt: 1, damageTaken: 1.3, kbDealt: 1, kbReceived: 1, gravity: 1.4, fallSpeed: 1.4, shield: 1, airFriction: 1, traction: 1),
    AttributeModifier(name: "Speed", baseDamage: 1, damageDealt: 0.7, damageTaken: 1, kbDealt: 1, kbReceived: 1, gravity: 1.2, fallSpeed: 1, shield: 1, airFriction: 1, traction: 1.5),
    AttributeModifier(name: "Shield", baseDamage: 1, damageDealt: 0.5, damageTaken: 0.5, kbDealt: 0.8, kbReceived: 0.6, gravity: 1, fallSpeed: 1, shield: 1.5, airFriction: 1, traction: 1),
    AttributeModifier(name: "Buster", baseDamage: 1, damageDealt: 1.4, damageTaken: 1.3, kbDealt: 0.65, kbReceived: 1, gravity: 1, fallSpeed: 1, shield: 1, airFriction: 1, traction: 1),
    AttributeModifier(name: "Smash", baseDamage: 1, damageDealt: 0.3, damageTaken: 1, kbDealt: 1.25, kbReceived: 1.2, gravity: 1, fallSpeed: 1, shield: 1, airFriction: 1, traction: 1)
                  ]
var heroRng = [
    AttributeModifier(name: "Oomph", baseDamage: 1, damageDealt: 1.6, damageTaken: 1.2, kbDealt: 1.1, kbReceived: 1, gravity: 1, fallSpeed: 1, shield: 1, airFriction: 1, traction: 1),
    AttributeModifier(name: "Psyche Up", baseDamage: 1, damageDealt: 1.2, damageTaken: 1, kbDealt: 1.2, kbReceived: 1, gravity: 1, fallSpeed: 1, shield: 1, airFriction: 1, traction: 1, shieldDamage: 1.65),
    AttributeModifier(name: "Acceleratle", baseDamage: 1, damageDealt: 1, damageTaken: 1, kbDealt: 1, kbReceived: 1.1, gravity: 1.25, fallSpeed: 1.5, shield: 1, airFriction: 1, traction: 2.1),
    AttributeModifier(name: "Oomph+Psyche Up", baseDamage: 1, damageDealt: 1.6 * 1.2, damageTaken: 1.2, kbDealt: 1.1 * 1.2, kbReceived: 1, gravity: 1, fallSpeed: 1, shield: 1, airFriction: 1, traction: 1, shieldDamage: 1.65),
    AttributeModifier(name: "Oomph+Acceleratle", baseDamage: 1, damageDealt: 1, damageTaken: 1.2, kbDealt: 1, kbReceived: 1.1, gravity: 1.25, fallSpeed: 1.5, shield: 1, airFriction: 1, traction: 2.1)
]

var baseParams: [String: Any] = [
    "walkSpeed": 1.575,
    "walkAddAcceleration": 0.189,
    "walkBaseAcceleration": 0.0,
    "groundFriction": 0.114,
    "dashInitialSpeed": 2.255,
    "runAddAcceleration": 0.0902,
    "runBaseAcceleration": 0.044,
    "runSpeed": 1.964,
    "jumpsquat": 3,
    "jumpInitialSpeed": 18.513,
    "jumpHeight": 33.66,
    "hopHeight": 16.26,
    "airJumpHeight": 33.66,
    "aerialAddAcceleration": 0.07,
    "aerialBaseAcceleration": 0.01,
    "airSpeed": 1.071,
    "airFriction": 0.00375,
    "gravity": 0.075,
    "fallSpeed": 1.58,
    "damageFlyTopGravity": 0.07224,
    "damageFlyTopFallSpeed": 1.8,
    "fastFallSpeed": 2.528,
    "weight": 90.0,
    "nairLandingLag": 7,
    "fairLandingLag": 10,
    "bairLandingLag": 10,
    "uairLandingLag": 8,
    "dairLandingLag": 14,
    "softLandingLag": 1,
    "hardLandingLag": 3,
    "fallingFrameToUseHardLandingLag": 4,
    "characterSizeMultiplier": 0.95,
    "shieldSize": 11.9,
    "shieldBreakHeight": 38.0,
    "guardSpeedLimit": 1.3,
    "jostleFront": 1.3,
    "jostleBack": 0.5,
    "jostleWeight": 5.0,
    "ledgeJumpHSpeed": 0.6,
    "ledgeJumpHeight": 36.83,
    "jab1ToJab2EndFrame": 30,
    "jab2ToJab3EndFrame": 0,
    "ftilt1ToFtilt2EndFrame": 0,
    "ftilt2ToFtilt3EndFrame": 0,
    "fsmash1ToFsmash2EndFrame": 0,
    "hasRapidJab": false,
    "attackInputsForRapidJab": 0,
    "rapidJabReboundDistance": 35.0,
    "rapidJabReboundCount": 5.0,
    "dtiltReboundDistance": 45.0,
    "dtiltReboundCount": 3.0,
    "fsmashMaxDamageMultiplier": 1.4,
    "usmashMaxDamageMultiplier": 1.4,
    "dsmashMaxDamageMultiplier": 1.4,
    "fsmashMaxChargeFrames": 60,
    "usmashMaxChargeFrames": 60,
    "dsmashMaxChargeFrames": 60,
    "fsmashMaxChargeHeldFrames": 120,
    "usmashMaxChargeHeldFrames": 120,
    "dsmashMaxChargeHeldFrames": 120,
    "jumpCount": 2,
    "hasCrawl": false,
    "hasWallJump": false,
    "hasWallCling": false,
    "hasZair": false,
    "footstoolJumpSpeedMultiplier": 1.3,
    "footstoolHopSpeedMultiplier": 0.7,
    "airborneFootstoolEndlag": 36,
    "wallJumpHSpeed": 1.3,
    "wallJumpVSpeed": 2.4,
    "finalSmashMeterDamageMultiplier": 0.7,
    "finalSmashMeterKBMultiplier": 0.3
]

let moveSources: [String: String] = [
    "none": "",
    "calculator": "Using Script data",
    "ultimateHitboxes": "Using Ultimate Hitboxes data",
    "kuroganeHammer": "Using Kurogane Hammer data"
]



// MARK: - Supporting Enums & Structs
enum MoveSource {
    case none, calculator, ultimateHitboxes
}

struct MoveSetGroup {
    var name: String
    var moves: [Move]
}

// MARK: - Character Class
class Character {
    // Properties
    var displayName: String
    var characterName: String
    var gameName: String
    var dataViewerName: String
    var ultHitboxesFilename: String
    var ultHitboxesName: String
    
    var name: String
    var filename: String
    var className: String
    var apiName: String
    var image: String = ""
    
    var modifier: AttributeModifier
    var modifiers: [AttributeModifier] = []
    var modifierIndex: String = "0"
    
    var params: [String: Any]
    var attributes: [String: Any]
    
    var moves: [Move] = []
    var moveset: [MoveSetGroup] = []
    var moveSource: MoveSource = .none
    var data: Any? // Replaces generic JS data object
    
    // Initializer
    init(displayName: String, calculatorRef: CalculatorProtocol?, scope: ScopeProtocol?, loadMoveData: Bool = false) {
        self.displayName = displayName
        self.characterName = displayName
        
        // Find index matching global arrays
        let index = displayNames.firstIndex(of: displayName) ?? 0
        let charName = characters[safe: index] ?? ""
        self.name = charName
        
        self.gameName = gameNames[safe: index] ?? ""
        self.dataViewerName = dataViewerNames[safe: index] ?? ""
        self.ultHitboxesFilename = ultHitboxesFilenames[safe: index] ?? ""
        
        if let underscoreIndex = self.ultHitboxesFilename.firstIndex(of: "_") {
            let nextIndex = self.ultHitboxesFilename.index(after: underscoreIndex)
            self.ultHitboxesName = String(self.ultHitboxesFilename[nextIndex...])
        } else {
            self.ultHitboxesName = self.ultHitboxesFilename
        }
        
        // Setup Parameters & Attributes
        self.params = baseParams
        self.attributes = baseParams
        
        // Modifiers & Defaults
        self.modifier = AttributeModifier(name: "Normal", m1: 1, m2: 1, m3: 1, m4: 1, m5: 1, m6: 1, m7: 1, m8: 1, m9: 1, m10: 1, m11: 1, m12: 1)
        setupModifiers()
        
        // String formatting for filenames and classes
        self.filename = displayName.lowercased().replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "& ", with: "")
        self.className = displayName.lowercased().replacingOccurrences(of: ".", with: "").replacingOccurrences(of: "& ", with: "and ").replacingOccurrences(of: " ", with: "-")
        
        // API name sanitization
        var apiTemp = self.name
        if charName == "Game And Watch" {
            apiTemp = "Mrgamewatch"
        }
        self.apiName = apiTemp.lowercased()
            .replacingOccurrences(of: "and", with: "")
            .replacingOccurrences(of: "&", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: " ", with: "")
        
        self.moves = [Move(id: -1)]
        self.moveset = []
        self.moveSource = .none
        
        updateImage()
        
        // Async Data Loading (uses [weak self] to prevent retain cycles)
        LoadCharacterData(self.gameName) { [weak self] extractedData in
            guard let self = self else { return }
            self.data = extractedData
            
            if let dataParams = extractedData.params {
                self.params = dataParams
                self.attributes = dataParams
            }
            
            calculatorRef?.update()
            self.moves = [Move(id: -1)]
            
            if loadMoveData {
                if let moveTypes = extractedData.moveTypes, !moveTypes.isEmpty {
                    // Local move data path
                    var attacks: [Any] = []
                    for moveType in moveTypes {
                        for innerMove in moveType.moves {
                            let moveData = MoveData(characterName: self.name, move: innerMove, type: moveType)
                            attacks.append(contentsOf: moveData.getHitboxes())
                            attacks.append(contentsOf: moveData.getThrows())
                        }
                    }
                    for (i, attack) in attacks.enumerated() {
                        self.moves.append(Move(id: i, data: attack))
                    }
                    self.moveSource = .calculator
                    self.moveset = self.mapMovesByName(self.moves)
                    
                    if let scope = scope {
                        if scope.calculator.selectedMove.shared {
                            self.moveset.insert(MoveSetGroup(name: scope.calculator.selectedMove.moveRef.nameId, moves: [scope.calculator.selectedMove]), at: 0)
                        }
                        scopeUpdate(scope)
                    }
                } else {
                    // Ultimate hitboxes JSON data path
                    let path = "./Data/ulthitboxes/\(self.ultHitboxesFilename).json"
                    LoadJsonFromPath(path) { [weak self] ultHitboxData in
                        guard let self = self else { return }
                        var attacks: [Any] = []
                        var moveTypes: [UltHitboxMoveData] = []
                        
                        for u in ultHitboxData.moves {
                            moveTypes.append(UltHitboxMoveData(u: u, params: self.params))
                        }
                        for moveType in moveTypes {
                            for innerMove in moveType.moves {
                                let moveData = MoveData(characterName: self.name, move: innerMove, type: moveType, isUltimate: true)
                                attacks.append(contentsOf: moveData.getHitboxes())
                                attacks.append(contentsOf: moveData.getThrows())
                            }
                        }
                        for (i, attack) in attacks.enumerated() {
                            self.moves.append(Move(id: i, data: attack))
                        }
                        self.moveSource = .ultimateHitboxes
                        self.moveset = self.mapMovesByName(self.moves)
                        
                        if let scope = scope {
                            if scope.calculator.selectedMove.shared {
                                self.moveset.insert(MoveSetGroup(name: scope.calculator.selectedMove.moveRef.nameId, moves: [scope.calculator.selectedMove]), at: 0)
                            }
                            scopeUpdate(scope)
                        }
                    }
                }
            } else {
                if let scope = scope {
                    scopeUpdate(scope)
                }
            }
        }
    }
    
    // MARK: - Core Methods
    func updateImage() {
        self.image = "./img/characters/\(self.filename).png"
    }
    
    func applyModifier(calculatorRef: CalculatorProtocol?) {
        self.attributes = self.params
        
        if let idx = Int(modifierIndex), modifiers.indices.contains(idx) {
            self.modifier = self.modifiers[idx]
            
            if var gravity = self.attributes["Gravity"] as? Double {
                gravity *= self.modifier.gravityMultiplier
                self.attributes["Gravity"] = gravity
            }
            if var fallSpeed = self.attributes["FallSpeed"] as? Double {
                fallSpeed *= self.modifier.fallSpeedMultiplier
                self.attributes["FallSpeed"] = fallSpeed
            }
            if var groundFriction = self.attributes["GroundFriction"] as? Double {
                groundFriction *= self.modifier.groundFrictionMultiplier
                self.attributes["GroundFriction"] = groundFriction
            }
            if var airFriction = self.attributes["AirFriction"] as? Double {
                airFriction *= self.modifier.airFrictionMultiplier
                self.attributes["AirFriction"] = airFriction
            }
        }
        calculatorRef?.update()
    }
    
    func attackerShowsModifierList() -> Bool {
        return modifiers.filter { $0.attackerListVisible }.count > 1
    }
    
    func targetShowsModifierList() -> Bool {
        return modifiers.filter { $0.targetListVisible }.count > 1
    }
    
    func mapMovesByName(_ moves: [Move]) -> [MoveSetGroup] {
        return moves.reduce(into: [MoveSetGroup]()) { result, currentMove in
            if let index = result.firstIndex(where: { $0.name == currentMove.moveRef.nameId }) {
                result[index].moves.append(currentMove)
            } else {
                result.append(MoveSetGroup(name: currentMove.moveRef.nameId, moves: [currentMove]))
            }
        }
    }
    
    // Helper helper function to parse dynamic conditions
    private func setupModifiers() {
        let normalMod = AttributeModifier(name: "Normal", m1: 1, m2: 1, m3: 1, m4: 1, m5: 1, m6: 1, m7: 1, m8: 1, m9: 1, m10: 1, m11: 1, m12: 1)
        let shortNormalMod = AttributeModifier(name: "Normal", m1: 1, m2: 1, m3: 1, m4: 1, m5: 1, m6: 1, m7: 1, m8: 1, m9: 1, m10: 1, m11: 1, m12: nil)
        
        switch self.name {
        case "Shulk", "Kirby":
            self.modifiers = [shortNormalMod] + monado
        case "Bowser Jr":
            self.modifiers = [
                AttributeModifier(name: "Clown Kart", m1: 1, m2: 1, m3: 0.88, m4: 1, m5: 1, m6: 1, m7: 1, m8: 1, m9: 1, m10: 1, m11: 1, m12: 1),
                AttributeModifier(name: "Body", m1: 1, m2: 1, m3: 1.15, m4: 1, m5: 1, m6: 1, m7: 1, m8: 1, m9: 1, m10: 1, m11: 1, m12: 1)
            ]
            self.modifier = self.modifiers[0]
        case "Rosalina And Luma":
            self.modifiers = [

