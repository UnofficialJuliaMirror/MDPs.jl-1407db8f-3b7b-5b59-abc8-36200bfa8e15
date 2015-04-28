module MDPs

using Compat

if VERSION < v"0.4-dev"
  using Docile
end

export # MDP types
       AbstractMDP,
       MDP,

       # Q-function types
       AbstractQFunction,
       ArrayQFunction,
       QFunction,  # constructor helper
       VectorQFunction,

       # transition probability types
       AbstractTransitionProbability,
       AbstractTransitionProbabilityArray,
       SparseTransitionProbabilityArray,
       TransitionProbability,  # constructor helper
       TransitionProbabilityArray,

       # reward types
       AbstractReward,
       AbstractArrayReward,
       Reward,  # constructor helper
       ArrayReward,
       SparseReward,

       # functions
       bellman,
       bellman!,
       getvalue,
       is_square_stochastic,
       ismdp,
       num_actions,
       num_states,
       policy,
       policy!,
       probability,
       reward,
       setvalue!,
       value,
       value!,
       valuetype,
       value_iteration,
       value_iteration!


include("transition.jl")
include("reward.jl")
include("qfunction.jl")
include("bellman.jl")
include("mdp.jl")
include("examples.jl")
include("utils.jl")

end # module
