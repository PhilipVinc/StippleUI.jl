module Checkbox

using Revise

import Genie, Stipple
import Genie.Renderer.Html: HTMLString, normal_element, template_

using Stipple

export checkbox

Genie.Renderer.Html.register_normal_element("q__checkbox", context = @__MODULE__)

function checkbox(label::String = "",
                  fieldname::Union{Symbol,Nothing} = nothing,
                  args...;
                  indeterminatevalue::Union{Any,Nothing} = nothing,
                  toggleorder::Union{String,Nothing} = nothing,
                  truevalue::Union{Any,Nothing} = nothing,
                  falsevalue::Union{Any,Nothing} = nothing,
                  toggleindeterminate::Bool = false,
                  keepcolor::Bool = false,
                  leftlabel::Bool = false,
                  kwargs...)

  k = (:label, )
  v = Any[label]

  if fieldname !== nothing
    k = (k..., Symbol("v-model"))
    push!(v, fieldname)
  end

  if indeterminatevalue !== nothing
    k = (k..., Symbol("indeterminate-value"))
    push!(v, indeterminatevalue)
  end

  if toggleorder !== nothing
    k = (k..., Symbol("toggle-order"))
    push!(v, toggleorder)
  end

  if truevalue !== nothing
    k = (k..., Symbol("true-value"))
    push!(v, truevalue)
  end

  if falsevalue !== nothing
    k = (k..., Symbol("false-value"))
    push!(v, falsevalue)
  end

  if toggleindeterminate
    k = (k..., Symbol("toggle-indeterminate"))
    push!(v, true)
  end

  if keepcolor
    k = (k..., Symbol("keep-color"))
    push!(v, true)
  end

  if leftlabel
    k = (k..., Symbol("left-label"))
    push!(v, true)
  end

  template_() do
    q__checkbox(args...; kwargs..., NamedTuple{k}(v)...)
  end
end

end