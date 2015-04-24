
facts("Transition probability types") do
    @fact AbstractTransitionProbabilityArray <: AbstractTransitionProbability => true
    @fact TransitionProbabilityArray <: AbstractTransitionProbabilityArray => true
    @fact SparseTransitionProbabilityArray <: AbstractTransitionProbabilityArray => true
    @fact TransitionProbabilityFunction <: AbstractTransitionProbability => true
end

facts("TransitionProbabilityArray methods") do
    P = TransitionProbabilityArray(cat(3, eye(5), eye(5)))
    @fact probability(P, 1, 1, 1) => 1.0
    @fact probability(P, 1, 2, 1) => 0.0
    @fact P[1, :, 1] => [1.0 0.0 0.0 0.0 0.0]
    @fact probability(P, 1) => eye(5)
    @fact num_states(P) => 5
    @fact num_actions(P) => 2
end

facts("SparseTransitionProbabilityArray methods") do
    P = SparseTransitionProbabilityArray([speye(5) for x=1:2])
    @fact probability(P, 1, 1, 1) => 1.0
    @fact probability(P, 1, 2, 1) => 0.0
    @fact probability(P, 1) => speye(5)
    @fact num_states(P) => 5
    @fact num_actions(P) => 2
end

facts("TransitionProbabilityFunction methods") do
    P = TransitionProbabilityFunction((s, t, a) -> s == t ? 1 : 0)
    @fact probability(P, 1, 1, 1) => 1
    @fact probability(P, 1, 2, 1) => 0
end

facts("helper constructor") do
    @fact typeof(TransitionProbability(cat(3, eye(5), eye(5)))) =>
        TransitionProbabilityArray{Float64}
    @fact typeof(TransitionProbability([speye(5) for x=1:2])) =>
        SparseTransitionProbabilityArray{Float64,Int}
    @fact typeof(TransitionProbability((s, t, a) -> s == t ? 1 : 0)) =>
        TransitionProbabilityFunction
end
