//
//  ReduxBond.swift
//  ReduxBond
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 SwiftRedux. All rights reserved.
//

import Bond
import Redux


/**

 Uses `createStateStream` to create a `Redux.Store<State>` using a
 `Bond.Observable<State>` stream.

 */
public func createStore<State>(
    reducer: ((State?, Action) -> State),
    state: State? = nil)
    -> Store<State> {

        return createStreamStore(createStream, reducer: reducer, state: state)
}


/**

 Accepts a `State` and returns `Redux.StateStream<State>` using a
 `Bond.Observable<State>` as the stream provider.

 */
public func createStream<State>(state: State) -> StateStream<State> {

    let observable = Observable(state)

    return StateStream(
        dispatch: observable.next,
        subscribe: { createDisposable(observable.observe($0)) },
        getState: { observable.value })
}


/**

 Accepts a `Bond.DisposableType` and returns it wrapped as a `ReduxDisposable`.

 */
public func createDisposable(disposable: DisposableType) -> ReduxDisposable {

    return SimpleReduxDisposable(disposed: { disposable.isDisposed }, dispose: disposable.dispose)
}
