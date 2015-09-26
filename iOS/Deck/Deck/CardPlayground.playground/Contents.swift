
enum Side {
    case Font
    case Back
}

enum Suit {
    case Club
    case Diamond
    case Heart
    case Spade
}

enum PlayingCardValue: Int, CustomStringConvertible {
    case Ace = 1
    case Two = 2
    case Three = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
    case Jack = 11
    case Queen = 12
    case King = 13
    
    var description: String {
        switch self {
        case .Ace:
            return "One"
        case .Two:
            return "Two"
        case .Three:
            return "Three"
        case .Four:
            return "Four"
        case .Five:
            return "Five"
        case .Six:
            return "Six"
        case .Seven:
            return "Seven"
        case .Eight:
            return "Eight"
        case .Nine:
            return "Nine"
        case .Ten:
            return "Ten"
        case .Jack:
            return "Jack"
        case .Queen:
            return "Queen"
        case .King:
            return "King"
        }
    }
}

protocol Card {
    typealias CardValue
    var name: String { get }
    var side: Side { get }
    var value: CardValue { get }
}

struct PlayingCard: Card {
    typealias CardValue = PlayingCardValue
    let name: String
    let value: CardValue
    let suit: Suit
    let side: Side
}

protocol CardStack {
    typealias CardType
    
    var cards: [CardType] { get }
    
    func shuffle()
    
    func getCardAt(index: Int)
    
    func invert() -> [CardType]
    
    func invertWith(subdeck: [CardType])
    
    func getSubdeckAt(startIndex: Int, endIndex: Int)
    
    func pop() -> CardType
    
    func popWith(number: Int) -> [CardType]
    
    func popAt(index: Int) -> CardType
    
    func push()
    
    func pushWith(number: Int)
    
    func pushAt(index: Int)
}

struct PlayingDeck: CardStack {
    typealias CardType = PlayingCard
    var cards: [CardType]
    
}

