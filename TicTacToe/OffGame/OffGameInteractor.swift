//
//  OffGameInteractor.swift
//  TicTacToe
//
//  Created by woong on 2021/06/25.
//  Copyright © 2021 Uber. All rights reserved.
//

import RIBs
import RxSwift

protocol OffGameRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol OffGamePresentable: Presentable {
    var listener: OffGamePresentableListener? { get set }
    func set(score: Score)
}

protocol OffGameListener: AnyObject {
    func didStartGame()
}

final class OffGameInteractor: PresentableInteractor<OffGamePresentable>, OffGameInteractable, OffGamePresentableListener {

    weak var router: OffGameRouting?
    weak var listener: OffGameListener?
    
    private let scoreStream: ScoreStream

    init(presenter: OffGamePresentable,
                  scoreStream: ScoreStream) {
        self.scoreStream = scoreStream
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        updateScore()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    private func updateScore() {
        scoreStream.score
            .subscribe(
                onNext: { (score: Score) in
                    self.presenter.set(score: score)
                }
            )
            .disposeOnDeactivate(interactor: self)
    }

    
    // MARK: - OffGamePresentableListener
    
    func startGame() {
        listener?.didStartGame()
    }
}
