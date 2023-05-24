import Pkg

#Pkg.activate()
#Pkg.add(name="Revise", version="3.4")
#Pkg.activate(".")
using Revise

atreplinit() do repl
    @eval using OhMyREPL
    # Reinstall keybindings to work around
    # https://github.com/KristofferC/OhMyREPL.jl/issues/166
    @async begin
        sleep(1)
        OhMyREPL.Prompt.insert_keybindings()
        OhMyREPL.enable_fzf(true)
    end
    #repl.options.confirm_exit = true
end

#hey() = run(`say 'hey dude'`)
hey() = run(`say 'all your base are belong to us'`)

using RAICode
using RelationalAI
using RAICode.Test

#ENV["DASSERT_LEVEL"] = 2
#ENV["DATALOG_JL_DEBUG"] = true
ENV["RAI_TRACEVIEW"] = 42
ENV["RAI_PRINT_CONSTANTS_HASHED"] = 0

conn = nothing
## === v1 === ###
function db(;dbname=:george, port=12123)
    global conn
    RAICode.Server.start!(RAICode.Server.RAIServer(RAICode.Server.Configuration(port=port)))
    #conn = RelationalAI.LocalConnection(;dbname=dbname, port=port)
    conn = RAICode.API.EmbeddedConnection(dbname)
    create_database(conn; overwrite=true)
    hey()
    return conn
end

q(args...; keyargs...) = query(conn, args...; keyargs...)
f(path; keyargs...) = q(read(path, String); keyargs...)

## === v2 === ##
#ctx = nothing
#function db2(;dbname=:george)
#    global conn, ctx
#    RAICode.Server.start!(RAICode.Server.RAIServer(RAICode.Server.Configuration(port=port)))
#    conn = RAICode.API.EmbeddedConnection(dbname)
#    create_database(conn; overwrite=true)
#    ctx = Context(load_config(; profile="local"))
#    return conn
#end

#ex(q::String; dbname=:george) = exec(ctx, dbname, " no-matter", q)
## ================== ##

using ReTestItems
T = runtests
using XUnit: runtests as xunittests
X(s) = xunittests([s])

hey()
