# ---------------
# Value Iteration
# ---------------

facts("discounted dense value iteration") do
    P, R = MDPs.Examples.small()
    mdp = MDP(P, R)
    qfunc = value_iteration(mdp, 0.9)
    @fact policy(qfunc) == [2, 1] => true
    @fact value(qfunc) => roughly([40.048625392716815, 33.65371175967546])
end

facts("undiscounted dense value iteration") do
    P, R = MDPs.Examples.small()
    mdp = MDP(P, R)
    qfunc = value_iteration(mdp, 1)
    @fact policy(qfunc) == [2, 1] => true
    @fact value(qfunc) => roughly([117.84153597421569, 111.72677122062753])
end

facts("discounted sparse value iteration") do
    P, R = MDPs.Examples.sprandom(10, 3)
    mdp = MDP(P, R)
    qfunc = value_iteration(mdp, 0.9)
    @fact typeof(qfunc) => VectorQFunction{Float64,Int}
    @fact typeof(policy(qfunc)) => Vector{Int}
    @fact typeof(value(qfunc)) => Vector{Float64}
end
