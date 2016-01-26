module GadflyDiff

using ComposeDiff
using Reactive
using Compose
using Gadfly

import Base: writemime
import IJulia


function writemime(io::IO, m::MIME"text/html", ctx::Signal{Gadfly.Plot})
    writemime(io, m, map(c -> draw(
        Patchable(
            Compose.default_graphic_width,
            Compose.default_graphic_height
        ), c), ctx))
end

using Requires

@require IJulia begin
    IJulia.metadata(::Reactive.Signal{Plot}) = Dict()
end

function __init__()
    for f in Requires.__inits__
        f()
    end
end

end # module
