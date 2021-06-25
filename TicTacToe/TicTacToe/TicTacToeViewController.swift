//
//  TicTacToeViewController.swift
//  TicTacToe
//
//  Created by woong on 2021/06/25.
//  Copyright © 2021 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol TicTacToePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TicTacToeViewController: UIViewController, TicTacToePresentable, TicTacToeViewControllable {

    weak var listener: TicTacToePresentableListener?
}
