import SwiftUI

protocol Router: AnyObject {
    var path: NavigationPath { get set }

    func push(_ screen: Screen)
    func pop()
    func popToRoot()
}
