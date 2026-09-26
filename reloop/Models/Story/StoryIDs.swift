import Foundation

enum EraID: String, Hashable, CaseIterable, Sendable {
    case y2010
    case y1980
    case y2080
    case unknown
}

enum SceneID: String, Hashable, CaseIterable, Sendable {
    /// Intro
    case intro

    // 1980
    case arrive1980
    case mysteriousFigure
    case posterChoice
    case readPoster
    case voltaTempoFound
    case tryPasswordChoice
    case passwordStep1
    case passwordStep2
    case passwordStep3
    case passwordStep4
    case passwordWrong

    // 2080
    case arrive2080
    case figureReturns
    case vTimerGreeting
    case vTimerWhatDoYouWant
    case vTimerHistory
    case calibration

    // Limbo
    case limboArrive
    case limboBrokenMachine
    case limboRepairChoice
    case limboFailedRepair
    case limboGiveUp

    // True ending path
    case home2010
    case fakeCredits
    case inconsistencyAlert
    case fixTimeline1980
    case fixTimeline2080
    case realization
    case memoryWipe
}

enum EndingID: String, Hashable, CaseIterable, Sendable {
    case machines
    case noReturn
    case limbo
    case eternalCycle
}

enum Destination: Hashable, Sendable {
    case scene(SceneID)
    case ending(EndingID)
}

enum ModelAsset: String, Sendable {
    case blank = "blank.usdz"
    case clock = "clock.usdz"
    case guy = "guy.usdz"
    case journal = "journal.usdz"
    case lab = "lab.usdz"
    case logo = "logo.usdz"
    case pc = "pc.usdz"
    case pcError = "pc_error.usdz"
    case pcRight = "pc_right.usdz"
    case pcRobot = "pc_robot.usdz"
}
