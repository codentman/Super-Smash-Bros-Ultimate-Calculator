//
//  KnockbackCalculator.swift
//  SSBU Calculator
//
//  Created by Cody Olivares on 7/15/26.
//
// Convert to Swift

//Bit Flagged state
import Foundation

struct KnockbackFlags: OptionSet {
    let rawValue: Int
    static let launchStart       = KnockbackFlags(rawValue: 1 << 0)
    static let grounded          = KnockbackFlags(rawValue: 1 << 1)
    static let sliding           = KnockbackFlags(rawValue: 1 << 2)
    static let aerial            = KnockbackFlags(rawValue: 1 << 3)
    static let collidingFloor    = KnockbackFlags(rawValue: 1 << 4)
    static let collidingWall     = KnockbackFlags(rawValue: 1 << 5)
    static let collidingCeiling  = KnockbackFlags(rawValue: 1 << 6)
}

struct CharacterState {
    static let launchStart      = 1
    static let grounded         = 2
    static let sliding          = 4
    static let aerial           = 8
    static let collidingFloor   = 16
    static let collidingWall    = 32
    static let collidingCeiling = 64
}

struct Collision {
    var frame: Int
    var stage: String
    var position: Point2D
    var next_position: Point2D
    var momentum: Double
    var state: Bool
    var tumble: Bool
    var launch_speed: Double
    var angle: Double
    // TODO: Port logic from the original JavaScript to Swift.
    // This is a minimal Swift skeleton to fix the invalid initializer placement error.

    // Example stored properties (fill in real types when porting):
   
    

    struct CollisionData {
    }

    var collision_data: CollisionData? = nil

    init(frame: Int) {
        self.frame = frame
    }
}

struct Point2D { var x: Double; var y: Double }

struct LaunchData {
    var positions: [Point2D]
    var finalPosition: Point2D
    var collisions: [Any] // TODO: Replace Any with concrete Collision when port is ready
    var hitstun: Int
    var airdodgeCancel: Bool
    var aerialCancel: Bool
    var faf: Int
    var KOFrame: Int

    init(positions: [Point2D],
         finalPosition: Point2D,
         collisions: [Any],
         hitstun: Int,
         airdodgeCancel: Bool,
         aerialCancel: Bool,
         faf: Int,
         KOFrame: Int) {
        self.positions = positions
        self.finalPosition = finalPosition
        self.collisions = collisions
        self.hitstun = hitstun
        self.airdodgeCancel = airdodgeCancel
        self.aerialCancel = aerialCancel
        self.faf = faf
        self.KOFrame = KOFrame
    }
}
struct DILine {
    var x: Double
    var y: Double
    var angle: Double
    var interpolated: Bool
    
    init(x: Double, y: Double, angle: Double, interpolated: Bool) {
        self.x = x
        self.y = y
        self.angle = angle
        self.interpolated = interpolated
    }
}

struct Distance {
    var kb: Double
    var x_launch_speed: Double
    var y_launch_speed: Double
    var tumble: Bool
    var hitstun: Int
    var speedupFrames: [Int]
    var isFKB: Bool
    var angle: Double
    var gravity: Double
    var damageflytop_gravity: Double
    var faf: Int
    var fall_speed: Double
    var damageflytop_fall_speed: Double
    var traction: Double
    var inverseX: Bool
    var onSurface: Bool
    var position: Point2D
    var stage: String?
    var doPlot: Bool
    var extraFrames: Int
    var ssb4Launch: Bool

    init(kb: Double,
         x_launch_speed: Double,
         y_launch_speed: Double,
         tumble: Bool,
         hitstun: Int,
         speedupFrames: [Int],
         isFKB: Bool,
         angle: Double,
         gravity: Double,
         damageflytop_gravity: Double,
         faf: Int,
         fall_speed: Double,
         damageflytop_fall_speed: Double,
         traction: Double,
         inverseX: Bool,
         onSurface: Bool,
         position: Point2D,
         stage: String? = nil,
         doPlot: Bool,
         extraFrames: Int? = nil,
         ssb4Launch: Bool) {
        self.kb = kb
        self.x_launch_speed = x_launch_speed
        self.y_launch_speed = y_launch_speed
        self.tumble = tumble
        self.hitstun = hitstun
        self.speedupFrames = speedupFrames
        self.isFKB = isFKB
        self.angle = angle
        self.gravity = gravity
        self.damageflytop_gravity = damageflytop_gravity
        self.faf = faf
        self.fall_speed = fall_speed
        self.damageflytop_fall_speed = damageflytop_fall_speed
        self.traction = traction
        self.inverseX = inverseX
        self.onSurface = onSurface
        self.position = position
        self.stage = stage
        self.doPlot = doPlot
        self.extraFrames = extraFrames ?? 20
        self.ssb4Launch = ssb4Launch
    }
}

/*
class DILine {
    constructor(x, y, angle, interpolated) {
        this.position = { x: x, y: y };
        this.angle = angle;
        this.interpolated = interpolated;
    }
}

class Distance{
    constructor(kb, x_launch_speed, y_launch_speed, tumble, hitstun, speedupFrames, isFKB, angle, damageFlyTop, gravity, damageflytop_gravity, faf, fall_speed, damageflytop_fall_speed, traction, inverseX, onSurface, position, stage, doPlot, extraFrames, ssb4Launch) {
        this.kb = kb;
        this.x_launch_speed = x_launch_speed;
        this.y_launch_speed = y_launch_speed;
        this.tumble = tumble;
        this.hitstun = hitstun;
        this.isFKB = isFKB;
        this.angle = angle;
        this.gravity = gravity;
        this.fall_speed = fall_speed;
        this.traction = traction;
        this.max_x = 0;
        this.max_y = 0;
        this.inverseX = inverseX;
        this.onSurface = onSurface;
        this.position = {"x":0, "y":0};
        this.bounce = false;
        this.extraFrames = 20;
        this.finalPosition = position;
        this.extra = [];
        this.collisions = 0;
        this.speedupFrames = speedupFrames;
        this.faf = faf;

        if (extraFrames !== undefined) {
            this.extraFrames = extraFrames;
        }
        this.damageflytop_gravity = damageflytop_gravity;
        this.damageflytop_fall_speed = damageflytop_fall_speed;
        
        if(position !== undefined){
            this.position = position;
        }
        this.stage = null;
        if(stage !== undefined && stage.stage != "No stage"){
            this.stage = stage;
        }
        if(this.stage == null){
            if(this.position.y < 0 && this.onSurface){
                this.position.y = 0;
            }
        }


        this.max_x = this.position.x;
        this.max_y = this.position.y;

        var x_speed = +this.x_launch_speed.toFixed(6);
        var y_speed = +this.y_launch_speed.toFixed(6);

        this.KO = false;

        if(this.inverseX){
            angle = InvertXAngle(angle);
        }

        var s = (this.kb / 80);

        var decay = { 'x': parameters.decay * Math.cos(angle * PI / 180), 'y': parameters.decay * Math.sin(angle * PI / 180) };
        if(Math.cos(angle * PI / 180) < 0){
            x_speed *= -1;
            //decay.x *= -1;
        }
        if(Math.sin(angle * PI / 180) < 0){
            y_speed *= -1;
            //decay.y *= -1;
        }

        if (ssb4Launch) {
            decay = { 'x': 0.051 * Math.cos(angle * PI / 180), 'y': 0.051 * Math.sin(angle * PI / 180) };
        }

        this.x = [this.position.x];
        this.y = [this.position.y];
        
        var character_position = { 'x': this.position.x, 'y': this.position.y };
        var launch_speed = { 'x': x_speed, 'y': y_speed };
        var next_position = { 'x': 0, 'y': 0 };
        var character_speed = { 'x': 0, 'y': 0 };
        this.vertical_speed = [];
        this.character_vertical_speed = [];
        var momentum = 1;
        var g = 0;
        var fg = 0;
        this.bounce_frame = -1;
        this.bounce_speed = 0;
        var state = CharacterState.LAUNCH_START;

        this.launch_speeds = [];
        var limit = hitstun < 200 ? hitstun + this.extraFrames : 200;

        var previousCollisionIntersection = null;
        var previousCollision = null;

        var slidingDirection = 0;

        var hc = HitstunCancel(kb, x_launch_speed, y_launch_speed, angle, false, false, 0);
        this.launchData = new LaunchData([{ x: this.position.x, y: this.position.y }], { x: 0, y: 0 }, [], hitstun, hc.airdodge, hc.aerial, faf, -1);

        var isDamageFlyTop = this.tumble && damageFlyTop;

        //var tumbleFSM = TumbleFSM(this.kb);

        var frameCount = 0;
        var ignoreGravityAdd = false;
        var waitFramesCollisionSpeedUp = 0;

        for (var i = 0; i < limit; i++){

            var next_x = character_position.x + launch_speed.x + character_speed.x;
            var next_y = character_position.y + launch_speed.y + character_speed.y;

            var prev_state = state;

            next_position.x = next_x;
            next_position.y = next_y;

            this.launch_speeds.push(Math.sqrt(Math.pow(launch_speed.x, 2) + Math.pow(launch_speed.y, 2)));

            this.vertical_speed.push((launch_speed.y));
            this.character_vertical_speed.push((character_speed.y));

            //Vertical direction
            if(next_y > character_position.y){
                momentum = 1;
            }else if(next_y < character_position.y){
                momentum = -1;
            }else{
                momentum = 0;
            }

            var countGravity = true;
            var collided = false;

            //Stage detection
            if (this.stage != null) {
                var c = new Collision(frameCount, this.stage, [character_position.x, character_position.y], [next_x, next_y], momentum, state, this.tumble, launch_speed, angle);

                if (c.collisionOccurred) {
                    collided = true;
                    
                    this.collisions++;
                    launch_speed = c.collision_data.launchSpeed;
                    next_x = c.collision_data.next_position[0];
                    next_y = c.collision_data.next_position[1];
                    angle = c.collision_data.angle;
                    momentum = c.collision_data.momentum;
                    state = c.collision_data.state;
                    previousCollision = c.collision_data.collision;
                    previousCollisionIntersection = c.collision_data.intersection;
                    slidingDirection = c.collision_data.slideDirection;
                    
                    decay = { 'x': parameters.decay * Math.cos(angle * PI / 180), 'y': parameters.decay * Math.sin(angle * PI / 180) };
                    if (ssb4Launch) {
                        decay = { 'x': 0.051 * Math.cos(angle * PI / 180), 'y': 0.051 * Math.sin(angle * PI / 180) };
                    }

                    if (this.tumble && !this.isFKB) {
                        waitFramesCollisionSpeedUp = GetNextFrameWithSpeedUp(speedupFrames, i);
                        c.applyDecaySpeedUp(decay, GetNextFrameWithSpeedUp(speedupFrames, i));
                    }
                    this.launchData.collisions.push(c);

                    if (c.collision_data.resetGravity) {
                        g = 0;
                        fg = 0;
                        countGravity = false;
                    }
                } else {
                    if (((state & CharacterState.SLIDING) == CharacterState.SLIDING) && previousCollision != null) {
                        countGravity = false;
                        g = 0;
                        fg = 0;
                        character_speed.y = 0;
                        if (!PointInLine([character_position.x, character_position.y], previousCollisionIntersection.line) && previousCollision.vertex.length > 2) {
                            //Check if the next position is in the line next to the one that started the slide
                            var prev_index = (previousCollisionIntersection.i - 1) % previousCollision.vertex.length;
                            var next_index = (previousCollisionIntersection.i + 1) % previousCollision.vertex.length;
                            var next_index2 = (previousCollisionIntersection.i + 2) % previousCollision.vertex.length;
                            if (prev_index == -1) {
                                prev_index = previousCollision.vertex.length-1;
                            }
                            //Get line that is on the direction of sliding direction
                            var prev_line = [previousCollision.vertex[prev_index], previousCollision.vertex[previousCollisionIntersection.i]];
                            var next_line = [previousCollision.vertex[next_index], previousCollision.vertex[next_index2]];
                            var prev_line_floor = GetLineType(previousCollision.materials[(prev_index - 1) % previousCollision.materials.length]) == LineTypes.FLOOR;
                            var next_line_floor = GetLineType(previousCollision.materials[(next_index - 1) % previousCollision.materials.length]) == LineTypes.FLOOR;
                            var material = null;
                            var selected_line = null;
                            var selected_index = 0;
                            if (slidingDirection == -1) {
                                //Left
                                if (prev_line[0][0] < previousCollisionIntersection.line[0][0] && prev_line_floor) {
                                    selected_line = prev_line;
                                    selected_index = prev_index;
                                    material = previousCollision.materials[prev_index];
                                } else if (next_line[0][0] < previousCollisionIntersection.line[0][0] && next_line_floor) {
                                    selected_line = next_line;
                                    selected_index = next_index;
                                    material = previousCollision.material[next_index];
                                }
                            } else if (slidingDirection == 1) {
                                //Right
                                if (prev_line[0][0] > previousCollisionIntersection.line[0][0] && prev_line_floor) {
                                    selected_line = prev_line;
                                    selected_index = prev_index;
                                    material = previousCollision.materials[prev_index];
                                } else if (next_line[0][0] > previousCollisionIntersection.line[0][0] && next_line_floor) {
                                    selected_line = next_line;
                                    selected_index = next_index;
                                    material = previousCollision.materials[next_index];
                                }
                            } else {
                                //Landed on this point and doesn't have horizontal momentum, so we end here
                                for (var ii = i; ii <= hitstun; i++) {
                                    //Fill the rest of the data until hitstun end
                                    this.x.push(+character_position.x.toFixed(6));
                                    this.y.push(+character_position.y.toFixed(6));
                                }
                                break;
                            }

                            if (selected_line != null) {

                                //We have the next line the character will continue to slide, recalculate angle and get next point
                                previousCollisionIntersection.line = selected_line;
                                previousCollisionIntersection.i = selected_index;
                                previousCollisionIntersection.point = p;

                                var sAngle = LineAngle(selected_line);
                                //Direction of the slope
                                if (slidingDirection == 1) {
                                    if (Math.cos(sAngle * PI / 180) < 0) {
                                        sAngle = ((sAngle - 180) + 360) % 360;
                                    }
                                } else if (slidingDirection == -1) {
                                    if (Math.cos(sAngle * PI / 180) > 0) {
                                        sAngle = (sAngle + 180) % 360;
                                    }
                                }
                                angle = sAngle;

                                launch_speed.y = 0;

                                if (Math.sin(sAngle * PI / 180) > 0) {
                                    momentum = 1;
                                } else if (Math.sin(sAngle * PI / 180) < 0) {
                                    momentum = -1;
                                } else {
                                    momentum = 0;
                                }

                                var p = ClosestPointToLine(GetPointFromSlide([character_position.x, character_position.y],launch_speed,angle,selected_line), selected_line);
                                next_x = p[0];
                                next_y = p[1];

                            } else {
                                state &= 0x9;
                                state |= CharacterState.AERIAL;
                                slidingDirection = 0;
                            }
                        } else {
                            //Same line
                            var p = ClosestPointToLine(GetPointFromSlide([character_position.x, character_position.y], launch_speed, angle, previousCollisionIntersection.line), previousCollisionIntersection.line);
                            next_x = p[0];
                            next_y = p[1];

                        }
                    } else {
                        state &= 0x9;
                        state |= CharacterState.AERIAL;
                        slidingDirection = 0;
                    }
                }
            } else {
                state &= 0x9;
                state |= CharacterState.AERIAL;
                slidingDirection = 0;
            }

            if (((state & CharacterState.SLIDING) == CharacterState.SLIDING)) {
                //Sliding on surface
                //Traction applied here
                if (launch_speed.x != 0) {
                    var x_dir = launch_speed.x / Math.abs(launch_speed.x);
                    if (launch_speed.x < 0) {
                        launch_speed.x += traction;
                    } else {
                        launch_speed.x -= traction;
                    }
                    launch_speed.x = +launch_speed.x.toFixed(6);
                    if (x_dir == -1 && launch_speed.x > 0) {
                        launch_speed.x = 0;
                    } else if (x_dir == 1 && launch_speed.x < 0) {
                        launch_speed.x = 0;
                    }
                }
                if (launch_speed.y != 0) {
                    var y_dir = launch_speed.y / Math.abs(launch_speed.y);
                    launch_speed.y -= decay.y;
                    launch_speed.y = +launch_speed.y.toFixed(6);
                    if (y_dir == -1 && launch_speed.y > 0) {
                        launch_speed.y = 0;
                    } else if (y_dir == 1 && launch_speed.y < 0) {
                        launch_speed.y = 0;
                    }
                }
                character_speed.y = 0;
                //launch_speed.y = 0;
                g = 0;
            } else if ((state & (CharacterState.COLLIDING_FLOOR - 1)) != 0) { //Not colliding
                //Apply decay
                if (launch_speed.x != 0) {
                    var x_dir = launch_speed.x / Math.abs(launch_speed.x);
                    launch_speed.x -= decay.x;
                    launch_speed.x = +launch_speed.x.toFixed(6);
                    if (x_dir == -1 && launch_speed.x > 0) {
                        launch_speed.x = 0;
                    } else if (x_dir == 1 && launch_speed.x < 0) {
                        launch_speed.x = 0;
                    }
                }
                if (launch_speed.y != 0) {
                    var y_dir = launch_speed.y / Math.abs(launch_speed.y);
                    launch_speed.y -= decay.y;
                    launch_speed.y = +launch_speed.y.toFixed(6);
                    if (y_dir == -1 && launch_speed.y > 0) {
                        launch_speed.y = 0;
                    } else if (y_dir == 1 && launch_speed.y < 0) {
                        launch_speed.y = 0;
                    }
                }
                //Gravity
                if (countGravity) {
                    if (!ignoreGravityAdd) {
                        if (!isDamageFlyTop) {
                                g -= gravity;
                                fg = Math.max(g, -fall_speed);
                                character_speed.y = fg;
                                character_speed.y = +character_speed.y.toFixed(6);
                            } else {
                                if (i < hitstun) {
                                    //Set DamageFlyTop values
                                    g -= damageflytop_gravity;
                                    fg = Math.max(g, -damageflytop_fall_speed);
                                    character_speed.y = fg;
                                    character_speed.y = +character_speed.y.toFixed(6);
                                } else {
                                    if (i == hitstun) {
                                        g = fg;
                                    }
                                    if (character_speed.y < -fall_speed) {
                                        //Current fall speed is higher than character normal fall speed, add gravity until it reduces to fall speed
                                        g += gravity;
                                        fg = Math.min(g, -fall_speed);
                                        character_speed.y = fg;
                                        character_speed.y = +character_speed.y.toFixed(6);
                                    } else {
                                        g -= gravity;
                                        fg = Math.max(g, -fall_speed);
                                        character_speed.y = fg;
                                        character_speed.y = +character_speed.y.toFixed(6);
                                    }
                                }
                            }
                    }
                } else {
                    character_speed.y = 0;
                }
            }

            character_position.x = next_x;
            character_position.y = next_y;

            if (!collided) {
                if (waitFramesCollisionSpeedUp <= 0) {
                    if (i + 1 < speedupFrames.length && this.tumble && !this.isFKB) {
                        if (GetFrameWithSpeedUp(speedupFrames, i) == i) {
                            this.launchData.positions.push({ x: +character_position.x.toFixed(6), y: +character_position.y.toFixed(6) });
                            frameCount++;
                            this.x.push(+character_position.x.toFixed(6));
                            this.y.push(+character_position.y.toFixed(6));
                        }
                    } else {
                        this.launchData.positions.push({ x: +character_position.x.toFixed(6), y: +character_position.y.toFixed(6) });
                        this.x.push(+character_position.x.toFixed(6));
                        this.y.push(+character_position.y.toFixed(6));
                        frameCount++;
                    }
                } else {
                    waitFramesCollisionSpeedUp--;
                    frameCount++;
                }
            } else {
                //Collided with stage
                this.launchData.positions.push({ x: +character_position.x.toFixed(6), y: +character_position.y.toFixed(6) });
                this.x.push(+character_position.x.toFixed(6));
                this.y.push(+character_position.y.toFixed(6));
                waitFramesCollisionSpeedUp--;
                frameCount++;
            }
    

            //Maximum position during hitstun
            if (i < hitstun) {
                if(Math.cos(angle*PI / 180) < 0){
                    this.max_x = Math.min(this.max_x, character_position.x);
                }else{
                    this.max_x = Math.max(this.max_x, character_position.x);
                }
                if(Math.sin(angle * PI / 180) < 0){
                    this.max_y = Math.min(this.max_y, character_position.y);
                }else{
                    this.max_y = Math.max(this.max_y, character_position.y);
                }
            }

            if (i == hitstun-1) {
                this.finalPosition = { "x": character_position.x, "y": character_position.y };
                this.launchData.finalPosition = { x: character_position.x, y: character_position.y };
            }

            if (i == 0) {
                state &= 0xFE; //Clear launch start flag
            }


            //if (!ssb4Launch) {
                
            //}
        }

        if (this.tumble && !this.isFKB) {
            hitstun = speedupFrames[speedupFrames.length - 1];
        } else {
            hitstun = this.hitstun;
        }
        this.launchData.hitstun = hitstun;

        this.vertical_speed.push((launch_speed.y));
        this.character_vertical_speed.push((character_speed.y));


        if (this.stage != null) {
            var ko = false;
            var crossed = false;
            var character_size = 0;

            //Calculate if KO in blast zones
            for (var i = 0; i <= hitstun && !ko; i++) {
                if (this.y[i] >= this.stage.blast_zones[2] + 30 || this.y[i] <= this.stage.blast_zones[3] - 30) {

                    this.extra.push(new Result("KO", "Frame " + i, "", false, true));
                    ko = true;
                    this.launchData.KOFrame = i;
                    break;
                }
                if (this.x[i] - character_size <= this.stage.blast_zones[0] || this.x[i] + character_size >= this.stage.blast_zones[1] || this.y[i] - character_size <= this.stage.blast_zones[3]) {

                    this.extra.push(new Result("KO", "Frame " + i, "", false, true));
                    ko = true;
                    this.launchData.KOFrame = i;
                    break;
                } else {
                    if (this.y[i] + character_size >= this.stage.blast_zones[2]) {
                        if (this.vertical_speed[i] >= 2.4) { //If it has lower launch speed it will pass the blast zone without a KO

                            this.extra.push(new Result("KO", "Frame " + i, "", false, true));
                            ko = true;
                            this.launchData.KOFrame = i;
                            break;
                        } else {
                            if (hitstun < (2.4 / 0.03) * 0.4) { //Hitstun frames is lower than 2.4 launch speed, this is used if the target is hit ON the blast zone

                                this.extra.push(new Result("KO", "Frame " + i, "", false, true));
                                ko = true;
                                this.launchData.KOFrame = i;
                                break;
                            } else {
                                //At least get launch speed the opponent had when crossing the blast zone
                                if (!crossed) {
                                    crossed = true;
                                    this.extra.push(new Result("Vertical launch speed when crossing blast zone", this.vertical_speed[i], "", false, true));
                                    this.extra.push(new Result("Required vertical launch speed to KO", "2.4", "", false, true));
                                    this.extra.push(new Result("Frame crossing blast zone", "Frame " + i, "", false, true));
                                }
                            }
                        }
                    }
                    else if (this.y[i] + character_size <= this.stage.camera[3] - 25) {
                        if (this.vertical_speed[i] + this.character_vertical_speed[i] <= -3) { //If it has lower launch speed it will pass the blast zone without a KO

                            this.extra.push(new Result("Meteor smash KO", "Frame " + i, "", false, true));
                            ko = true;
                            this.launchData.KOFrame = i;
                            break;
                        }
                    }
                }

            }

            this.KO = ko;
        }

        this.diLines = [];

        this.doDILine = function (di, koAtZero) {
            if (koAtZero) {
                //KO regardless of DI
                this.diLines.push(new DILine(this.position.x, this.position.y, -1, false));
                return;
            }

            if (this.kb >= 80)
                this.diLines.push(new DILine(this.position.x, this.position.y, di % 360, false));
            else
                this.diLines.push(new DILine(this.position.x, this.position.y, -2, false));

        }

    }
};

class Knockback {
    constructor(kb, angle, gravity, damageflytop_gravity, aerial, windbox, electric, percent, set_weight, stick, launch_rate) {
        this.base_kb = kb;
        if(this.base_kb > 2500){
            //this.base_kb = 2500;
        }
        this.kb = this.base_kb;
        this.original_angle = angle;
        this.base_angle = angle;
        this.angle_with_di = angle;
        this.angle = angle;
        this.gravity = gravity;
        this.aerial = aerial;
        this.windbox = windbox;
        this.set_weight = set_weight;
        this.tumble = false;
        this.can_jablock = false;
        this.di_able = false;
        this.add_gravity_speed = parameters.gravity.mult * (this.gravity - parameters.gravity.constant);
        this.percent = percent;
        this.reeling = false;
        this.spike = false;
        this.di_change = 0;
        this.launch_speed = LaunchSpeed(kb);
        this.total_launch_speed = this.launch_speed;
        this.lsi = 1;
        this.horizontal_launch_speed = 0;
        this.vertical_launch_speed = 0;
        this.launch_rate = launch_rate;
        this.electric = electric;
        this.damageflytop = this.tumble && this.angle >= ToDegrees(1.22173) && this.angle <= ToDegrees(1.91986);
        this.damageflytop_gravity = damageflytop_gravity;

        if (this.launch_rate == undefined) {
            this.launch_rate = 1;
        }
        this.hitstun = Hitstun(this.base_kb, this.windbox, this.electric);
        if (stick !== undefined) {
            this.stick = stick;
        } else {
            this.stick = { X: 0, Y: 0 };
        }
        this.calculate = function () {
            var groundedZeroAngle = false;
            this.kb = this.base_kb * this.launch_rate;
            if (this.original_angle == 361) {
                this.base_angle = SakuraiAngle(this.kb, this.aerial);
            }
            if (!this.aerial && this.base_angle == 0) {
                groundedZeroAngle = true;
            }
            this.angle = this.base_angle;
            this.tumble = Hitstun(this.kb, windbox, false, true) + 1 >= parameters.tumble_threshold && !windbox;
            if (this.base_angle != 0 && this.base_angle != 180) {
                this.tumble = Hitstun(this.kb, windbox, false, true) + 1 >= parameters.tumble_threshold && !windbox;
            }
            if ((this.base_angle == 0 || this.base_angle == 180) && this.aerial) {
                this.tumble = Hitstun(this.kb, windbox, false, true) + 1 >= parameters.tumble_threshold && !windbox;
            }
            if ((this.angle == 0 || this.angle == 180) && this.kb >= 120) {
                groundedZeroAngle = false;
                this.angle = 32;
                this.tumble = Hitstun(this.kb, windbox, false, true) + 1 >= parameters.tumble_threshold && !windbox;
            }


            var gravity = this.gravity;

            this.damageflytop = this.tumble && this.angle >= ToDegrees(1.22173) && this.angle <= ToDegrees(1.91986);

            //if (this.damageflytop)
            //    gravity = this.damageflytop_gravity;
            //else
            //    gravity = this.gravity;

            this.add_gravity_speed = parameters.gravity.mult * (gravity - parameters.gravity.constant);
            if (!this.tumble || this.set_weight || this.damageflytop) {
                this.add_gravity_speed = 0;
            }

            this.x = Math.cos(this.angle * PI / 180) * this.kb;
            this.y = Math.sin(this.angle * PI / 180) * this.kb;
            this.launch_speed = LaunchSpeed(this.kb);
            this.horizontal_launch_speed = this.launch_speed * Math.cos(this.angle * PI / 180);
            this.vertical_launch_speed = (this.launch_speed * Math.sin(this.angle * PI / 180)) + this.add_gravity_speed;

            if ((this.base_angle == 0 || this.base_angle == 180) && !this.aerial) {
                //this.horizontal_launch_speed = HorizontalGroundedSpeedLimit(this.horizontal_launch_speed);
            } else {
                //this.horizontal_launch_speed = HorizontalSpeedLimit(this.horizontal_launch_speed);
                this.angle = GetAngle(this.horizontal_launch_speed, this.vertical_launch_speed);
            }

            //this.vertical_launch_speed = VerticalSpeedLimit(this.vertical_launch_speed);

            if (this.windbox && !this.aerial)
                this.vertical_launch_speed = 0;

            this.di_able = this.tumble && Math.abs(Math.atan2(this.vertical_launch_speed, this.horizontal_launch_speed)) >= parameters.di;

            if (this.di_able && (this.stick.x != 0 || this.stick.y != 0)) {

                this.launch_speed = Math.sqrt(Math.pow(this.horizontal_launch_speed, 2) + Math.pow(this.vertical_launch_speed, 2)); //Include gravity boost to the new launch speed (yes this only happens when stick isn't on neutral)

                this.angle = DI(this.stick, { X: this.horizontal_launch_speed, Y: this.vertical_launch_speed }, this.launch_speed);

                this.angle_with_di = this.angle;

                if (this.damageflytop)
                    gravity = this.damageflytop_gravity;
                else
                    gravity = this.gravity;

                this.lsi = LSI(this.stick.y, this.angle);
                
                this.launch_speed *= this.lsi;

                this.horizontal_launch_speed = this.launch_speed * Math.cos(this.angle * PI / 180);
                this.vertical_launch_speed = (this.launch_speed * Math.sin(this.angle * PI / 180));

                //this.horizontal_launch_speed = HorizontalSpeedLimit(this.horizontal_launch_speed);
                //this.vertical_launch_speed = VerticalSpeedLimit(this.vertical_launch_speed);
                
            }

            this.x = Math.abs(Math.cos(this.angle * PI / 180) * this.kb);
            this.y = Math.abs(Math.sin(this.angle * PI / 180) * this.kb);

            this.horizontal_launch_speed = Math.abs(this.horizontal_launch_speed);
            this.vertical_launch_speed = Math.abs(this.vertical_launch_speed);

            this.total_launch_speed = TotalLaunchSpeed(this.horizontal_launch_speed, this.vertical_launch_speed);

            if (groundedZeroAngle) {
                this.total_launch_speed *= 0.8;
                this.horizontal_launch_speed *= 0.8;
                this.vertical_launch_speed *= 0.8;
            }

            this.can_jablock = false;
            if (this.angle == 0 || this.angle == 180 || this.angle == 360) {
                if (this.kb != 0 && !this.windbox && !this.aerial) {
                    this.can_jablock = true;
                }
            }
            this.spike = this.angle >= 230 && this.angle <= 310;
            if (this.spike) {
                if (this.kb != 0 && !this.windbox && !this.aerial) {
                    this.can_jablock = !this.tumble;
                }
            }

            if (this.angle <= 70 || this.angle >= 110) {
                this.reeling = this.tumble && !this.windbox && this.percent >= 100;
            }

            this.hitstun = Hitstun(this.base_kb, this.windbox, this.electric);
        };
        this.addModifier = function (modifier) {
            this.base_kb *= modifier;
            this.calculate();
        };
        this.bounce = function (bounce) {
            if (bounce) {
                this.vertical_launch_speed *= parameters.bounce;
                this.horizontal_launch_speed *= parameters.bounce;
            }
        }

        
        this.calculate();
    }

    

};

class PercentFromKnockback{
    constructor(kb, type, base_damage, damage, preDamage, angle, weight, gravity, fall_speed, aerial, bkb, kbg, fkb, attacker_percent, r, queue, shieldQueue, ignoreStale, windbox, electric, dddinhale, launch_rate){
        this.base_kb = kb;
        if(this.base_kb > 2500){
            //this.base_kb = 2500;
        }
        this.type = type;
        this.original_angle = angle;
        this.base_angle = angle;
        this.base_damage = base_damage;
        this.preDamage = preDamage;
        this.damage = damage;
        this.angle = angle;
        this.gravity = gravity;
        this.fall_speed = fall_speed;
        this.aerial = aerial;
        this.bkb = bkb;
        this.kbg = kbg;
        this.fkb = fkb;
        this.r = r;
        this.dddinhale = dddinhale;
        this.windbox = windbox;
        this.weight = weight;
        this.attacker_percent = attacker_percent;
        this.rage = Rage(attacker_percent);
        this.tumble = false;
        this.can_jablock = false;
        this.di_able = false;
        this.add_gravity_speed = 5 * (this.gravity - 0.075);
        this.add_gravity_kb = this.add_gravity_speed / 0.03;
        this.reeling = false;
        this.training_percent = 0;
        this.vs_percent = 0;
        this.queue = queue;
        this.shieldQueue = shieldQueue;
        this.ignoreStale = ignoreStale;
        this.fkb_kb = -1;
        this.fkb_modifier = 1;
        this.electric = electric;
        
        this.launch_rate = launch_rate;
        if (this.launch_rate == undefined) {
            this.launch_rate = 1;
        }

        this.training_formula = function(kb, base_damage, damage, weight, kbg, bkb, r, dddinhale){
            var s = 1;
            return ((500 * (dddinhale ? 4 : 1)) * kb * (weight + 100) - (r * (kbg * (7 * damage * s * (3 * base_damage * s + 7 * base_damage + 20) + (90 * (dddinhale ? 4 : 1)) * (weight + 100)) + (500 * (dddinhale ? 4 : 1)) * bkb * (weight + 100)))) / (7 * kbg * r * (base_damage * (3 * s + 7) + 20)) - preDamage;
        }

        this.vs_formula = function (kb, base_damage, damage, weight, kbg, bkb, r, dddinhale, attacker_percent, queue, shieldQueue, ignoreStale){
            var s = StaleNegation(queue, shieldQueue, ignoreStale);
            r = r * Rage(attacker_percent) * this.launch_rate;
            return ((500 * (dddinhale ? 4 : 1)) * kb * (weight + 100) - (r * (kbg * (7 * damage * s * (3 * base_damage * s + 7 * base_damage + 20) + (90 * (dddinhale ? 4 : 1)) * (weight + 100)) + (500 * (dddinhale ? 4 : 1)) * bkb * (weight + 100)))) / (7 * kbg * r * (base_damage * (3 * s + 7) + 20)) - preDamage;
        }

        if(this.fkb == 0){
            if(this.type == "total"){
                this.kb = kb;
            }
            if(this.type == "x"){
                this.x = kb;
            }
            if(this.type == "y"){
                this.y = kb;
            }
        }


        if (this.fkb == 0) {
            this.calculate = function () {


                if (this.original_angle == 361) {
                    this.base_angle = SakuraiAngle(this.kb, this.aerial);
                }
                this.angle = this.base_angle;

                if (this.original_angle == 361 && !this.aerial && type != "total") {
                    //Find the original kb and get the angle
                    var angle_found = false;
                    for (var temp_kb = 59.999; temp_kb < 88; temp_kb += 0.001) {
                        var temp_angle = SakuraiAngle(temp_kb, this.aerial);
                        var temp_var = 0;
                        if (this.type == "x") {
                            temp_var = Math.abs(temp_kb * Math.cos(temp_angle * PI / 180));
                            if (temp_var >= this.x) {
                                this.angle = temp_angle;
                                angle_found = true;
                                break;
                            }
                        }
                        if (this.type == "y") {
                            temp_var = Math.abs(temp_kb * Math.sin(temp_angle * PI / 180));
                            if (temp_var >= this.y) {
                                this.angle = temp_angle;
                                angle_found = true;
                                break;
                            }
                        }
                    }
                    if (!angle_found) {
                        this.angle = SakuraiAngle(88, this.aerial);
                    }
                }

                if (this.fkb!=0) {
                    if (this.type == "x") {
                        this.kb = Math.abs(this.x / Math.cos(this.angle * PI / 180));
                    }
                    if (this.type == "y") {
                        this.kb = Math.abs(this.y / Math.sin(this.angle * PI / 180));
                    }
                }


                this.hitstun = Hitstun(this.kb, this.windbox, this.electric);

                if (this.base_angle != 0 && this.base_angle != 180) {
                    this.tumble = this.kb >= 80 && !windbox;
                    this.di_able = this.tumble;
                }


                /*if (this.angle == 0 || this.angle == 180  || (this.angle >= 181 && this.angle < 360)) {
                    this.add_gravity_kb = 0;
                }*/
                if (this.kb > 80 && (this.angle != 0 && this.angle != 180)) {
                    //this.y *= this.gravity_mult;
                    if (this.type == "y") {
                        this.kb = Math.abs(this.y / Math.sin(this.angle * PI / 180));
                    }
                }

                this.can_jablock = false;
                if (this.angle == 0 || this.angle == 180 || this.angle == 360) {
                    if (this.kb != 0 && !this.windbox) {
                        this.can_jablock = true;
                    }
                }
                if (this.angle >= 240 && this.angle <= 300) {
                    if (this.kb != 0 && !this.windbox) {
                        this.can_jablock = !this.tumble;
                    }
                }
                if (this.angle <= 70 || this.angle >= 110) {
                    this.reeling = this.tumble && !this.windbox && this.percent >= 100;

                }

                this.training_percent = this.training_formula(this.kb, this.base_damage, this.damage, this.weight, this.kbg, this.bkb, this.r, this.dddinhale);
                this.vs_percent = this.vs_formula(this.kb, this.base_damage, this.damage, this.weight, this.kbg, this.bkb, this.r, this.dddinhale, this.attacker_percent, this.queue, this.shieldQueue, this.ignoreStale);


                if (this.training_percent < 0) {
                    this.training_percent = 0;
                }
                if (this.training_percent > 999 || isNaN(this.training_percent)) {
                    this.training_percent = -1;
                }
                if (this.vs_percent < 0) {
                    this.vs_percent = 0;
                }
                if (this.vs_percent > 999 || isNaN(this.vs_percent)) {
                    this.vs_percent = -1;
                }

            };
        } else {
            this.calculate = function () {
                this.kb = this.base_kb * this.fkb_modifier;
                this.rage_needed = -1;
                this.vs_percent = 0;
                var fkb = WeightBasedKB(this.weight, this.bkb, this.fkb, this.kbg, this.gravity, this.fall_speed, this.r, 0, this.damage, 0, this.angle, this.aerial, this.windbox, -1, this.lsi);
                fkb.addModifier(this.fkb_modifier);
                this.fkb_kb = fkb.kb;
                if (this.kb <= this.fkb_kb) {
                    this.training_percent = 0;
                }
                if (this.kb > this.fkb_kb) {
                    this.training_percent = -1;
                }
                var rage = this.kb / this.fkb_kb;
                if (rage >= 1 && rage <= 1.15) {
                    this.vs_percent = (5 / 3) * ((460 * rage) - 439);
                    this.vs_percent = +this.vs_percent.toFixed(6);
                    this.rage_needed = +rage.toFixed(6);
                } else {
                    if (this.kb <= this.fkb_kb) {
                        this.vs_percent = 0;
                    }
                    if (this.kb > this.fkb_kb) {
                        this.vs_percent = -1;
                    }
                }
            }
        }
        this.addModifier = function (modifier) {
            this.kb /= modifier;
            this.base_kb /= modifier;
            this.add_gravity_kb /= modifier;
            this.fkb_modifier *= modifier;
            this.calculate();
        };
        this.bounce = function (bounce) {
            if (bounce) {
                //this.kb /= 0.8;
                this.calculate();
            }
        }
        this.calculate();
    }
};
*/
