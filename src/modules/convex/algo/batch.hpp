/* ----------------------------------------------------------------------- *//**
 *
 * @file batch.hpp
 *
 * Generic implementaion of incremental gradient descent, in the fashion of
 * user-definied aggregates. They should be called by actually database
 * functions, after arguments are properly parsed.
 *
 *//* ----------------------------------------------------------------------- */

#include <dbconnector/dbconnector.hpp>

#ifndef MADLIB_MODULES_CONVEX_ALGO_BATCH_HPP_
#define MADLIB_MODULES_CONVEX_ALGO_BATCH_HPP_

namespace madlib {

namespace modules {

namespace convex {

// use Eigen
using namespace madlib::dbal::eigen_integration;

// The reason for using ConstState instead of const State to reduce the
// template type list: flexibility to high-level for mutability control
// More: cast<ConstState>(MutableState) may not always work
template <class State, class ConstState, class Task>
class Batch {
public:
    typedef State state_type;
    typedef ConstState const_state_type;
    typedef typename Task::tuple_type tuple_type;
    typedef typename Task::model_type model_type;

    static void transition(state_type &state, const tuple_type &tuple);
    static void merge(state_type &state, const_state_type &otherState);
    static void final(state_type &state);
};

template <class State, class ConstState, class Task>
void
Batch<State, ConstState, Task>::transition(state_type &state,
        const tuple_type &tuple) {
    Task::incrementGradient(
            state.task.model,
            state.algo.incrModel,
            tuple.indVar,
            tuple.depVar,
            state.task.stepsize * tuple.weight);
}

template <class State, class ConstState, class Task>
void
Batch<State, ConstState, Task>::merge(state_type &state,
        const_state_type &otherState) {
    if (state.algo.numRows == 0) {
        state.algo.incrModel = otherState.algo.incrModel;
        return;
    } else if (otherState.algo.numRows == 0) {
        return;
    }

    // The reason of this weird algorithm instead of an intuitive one
    // -- (w1 * m1 + w2 * m2): we have only one mutable state,
    // therefore, (m1 * w1 / w2  + m2)  * w2.
    double totalNumRows = static_cast<double>(state.algo.numRows + otherState.algo.numRows);
    state.algo.incrModel *= static_cast<double>(state.algo.numRows) /
        static_cast<double>(otherState.algo.numRows);
    state.algo.incrModel += otherState.algo.incrModel;
    state.algo.incrModel *= static_cast<double>(otherState.algo.numRows);
}

template <class State, class ConstState, class Task>
void
Batch<State, ConstState, Task>::final(state_type &state) {
    //state.algo.incrModel *= 1/static_cast<double>(state.algo.numRows);
    state.task.model += state.algo.incrModel;
}

} // namespace convex

} // namespace modules

} // namespace madlib

#endif

