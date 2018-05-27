protocol Observable {
    func addObserver(observer: Observer)
    func removeObserver (observer: Observer)
    func notifyObservers()
}

protocol Observer {
    var id: String {get set}
    func update (value: Int?)
}

final class CustomClassToObserv: Observable {
    private var observers: [Observer] = []
    var ObservarbleValue: Int? {
        didSet {
            notifyObservers()
        }
    }

    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        guard let index = observers.enumerated().first(where: { $0.element.id == observer.id })?.offset else { return }
        observers.remove(at: index)
    }
    
    func notifyObservers() {
        observers.forEach { $0.update(value: ObservarbleValue) }
    }
}

final class first: Observer {
    var id = "first"
    
    func update(value: Int?) {
        guard let ObservarbleValue = value else { return }
        print("first updated value: \(ObservarbleValue)")
    }
}

final class second: Observer {
    var id = "second"
    
    func update(value: Int?) {
        guard let ObservarbleValue = value else { return }
        print("second updated value: \(ObservarbleValue)")
    }
}

final class therd: Observer {
    var id = "therd"
    
    func update(value: Int?) {
        guard let ObservarbleValue = value else { return }
        print("second updated value: \(ObservarbleValue)")
    }
}

let resource = CustomClassToObserv()
let first_ = first()
let second_ = second()
let therd_ = therd()

resource.addObserver(observer: first_)
resource.addObserver(observer: second_)


resource.ObservarbleValue = 7
resource.ObservarbleValue = 7

resource.addObserver(observer: therd_)

resource.ObservarbleValue = 4

resource.removeObserver(observer: second_)
resource.removeObserver(observer: first_)

resource.ObservarbleValue = 1
resource.ObservarbleValue = 5
resource.ObservarbleValue = 5
resource.ObservarbleValue = 5
