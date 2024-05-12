struct Loadable<Model> {

    private(set) var model: Model?
    private(set) var isLoaded: Bool

    init(model: Model? = nil, isLoaded: Bool = false) {
        self.model = model
        self.isLoaded = isLoaded
    }

    mutating func update(model: Model) {
        self.model = model
        self.isLoaded = true
    }
}
