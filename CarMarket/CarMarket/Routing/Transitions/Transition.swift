//
//  Transition.swift
//  CarMarket
//
//  Created by Viktor Drykin on 06.05.2025.
//

import UIKit

protocol Transition: AnyObject {
    var isAnimated: Bool { get set }

    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?)
    func close(_ viewController: UIViewController, completion: (() -> Void)?)
}
