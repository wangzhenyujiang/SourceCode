//: Playground - noun: a place where people can play

protocol Brid: BooleanType {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeddVelocity: Double { get }
}

struct FlappyBird: Brid, Flyable{
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    var airspeddVelocity: Double {
        return 3 * flappyAmplitude * flappyFrequency
    }
}

struct Penguin: Brid {
    let name: String
    let canFly = false
}

struct SwiftBird: Brid, Flyable {
    var name: String { return "Swift \(version)"}
    let version: Double
    
    var airspeddVelocity: Double {
        return 2000.0
    }
}

//canFly 的默认值为 true,只有遵循 Flyable 协议的类才能飞
extension Brid where Self: Flyable {
    var canFly: Bool {
        return true
    }
}

enum UnladenSwallow: Brid, Flyable {
    case African, European, Unknow
    
    var name: String {
        switch self {
        case .African:
            return "Afircan"
        case .European:
            return "European"
        case .Unknow:
            return "Unknow"
        }
    }
    
    var airspeddVelocity: Double {
        switch self {
        case .African:
            return 10.0
        case .European:
            return 20.0
        case .Unknow:
            fatalError("UnKnow Place")
        }
    }
}

//扩展 BooleanType 使其有 Bool 值的属性
extension BooleanType where Self: Brid {
    var boolValue: Bool {
        return self.canFly
    }
}

// Bird 遵循 BooleanType 协议后，遵循 Bird 协议的类就可以当做 Bool 使用
if UnladenSwallow.African {
    print("can fly")
}else {
    print("just sit here")
}
