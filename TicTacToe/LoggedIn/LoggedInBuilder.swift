//
//  LoggedInBuilder.swift
//  TicTacToe
//
//  Created by woong on 2021/06/25.
//  Copyright © 2021 Uber. All rights reserved.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Make sure to convert the variable into lower-camelcase.
    var loggedInViewController: LoggedInViewControllable { get }
    // TODO: Declare the set of dependencies required by this RIB, but won't be
    // created by this RIB.
}

final class LoggedInComponent: Component<LoggedInDependency> {

    fileprivate var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }
    
    let player1Name: String
    let player2Name: String

    init(dependency: LoggedInDependency, player1Name: String, player2Name: String) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener,
               player1Name: String,
               player2Name: String) -> LoggedInRouting
}


final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {
    
    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener, player1Name: String, player2Name: String) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency,
                                              player1Name: player1Name,
                                              player2Name: player2Name)
        let interactor = LoggedInInteractor()
        interactor.listener = listener
        
        let offGameBuilder = OffGameBuilder(dependency: component)
        let ticTacToeBuilder = TicTacToeBuilder(dependency: component)
        return LoggedInRouter(interactor: interactor,
                              viewController: component.loggedInViewController,
                              offGameBuilder: offGameBuilder,
                              ticTacToeBuilder: ticTacToeBuilder)
    }
}
