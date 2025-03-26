import UIKit

struct HomeScene {
    let title: String
    let icon: UIImage?
    let viewController: UIViewController.Type
}

final class HomeScenesList {
    static let scenes: [HomeScene] = [
        HomeScene(
            title: "§4 Dicee game",
            icon: UIImage(named: "dicee_icon"),
            viewController: DiceeGameSceneViewController.self
        ),
        HomeScene(
            title: "§5 Magic 8 Ball",
            icon: UIImage(named: "magicball_icon"),
            viewController: DiceeGameSceneViewController.self
        )
    ]
} 
