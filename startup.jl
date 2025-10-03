import Pkg
using Revise

#Pkg.instantiate(); Pkg.build("RAICode")
#using RAICode.Compiler.Front: debug_set_query_layering!; debug_set_query_layering!(; enabled=true)

atreplinit() do repl
    @eval using OhMyREPL
    # Reinstall keybindings to work around
    # https://github.com/KristofferC/OhMyREPL.jl/issues/166
    @async begin
        sleep(1)
        OhMyREPL.Prompt.insert_keybindings()
        OhMyREPL.enable_fzf(true)
    end
    # repl.options.confirm_exit = true
end

#=
using RAICode
using RAICode.API
using RAICode.Server
using RelationalAI: LocalConnection
loc(dbname) = LocalConnection(;dbname=dbname)
emb(dbname) = API.EmbeddedConnection(dbname)
ser = nothing
function serve()
    global ser
    ser = Server.start!(Server.RAIServer(Server.Configuration()))
    return nothing
end
dbname = nothing
function db()
    global dbname
    dbname = API.create_database(;prefix="george")
    run(`say "work done"`)
    return dbname
end
=#

#=
using RAI
ctx = Context(load_config(; profile="local"))
v2(q::String; keyargs...) = v2(q, string(dbname); keyargs...)
v2(q::String, dbname::String; keyargs...) = exec(ctx, dbname, "no-matter", q; keyargs...)
p2(q::String) = show_result(v2(q))
f2(path; keyargs...) = v2(read(path, String); keyargs...)
=#

#run(`say "Work work"`)
#@info "✨✨✨ Work! Work! ✨✨✨"

if isinteractive()
    @eval import BasicAutoloads
    @eval BasicAutoloads.register_autoloads([
        ["@benchmark", "@btime"] => :(using BenchmarkTools),
        ["@infiltrate"] => :(using Infiltrator),
        ["@test_rel", "runtests"] => :(using RAICode.Test, ReTestItems),
        ["@t"] => quote
            using RAICode.Test
            using ReTestItems
            macro t(s); return :( runtests($s) ); end
            macro t(s, name); return :( runtests($s; name=$name) ); end
        end,
        ["@mig", "@migstr", "corerel_migrate_file", "corerel_migrate_dir", "__test_migrate"] => quote
            using RAI_Primitives.CoreRelMigrator: corerel_migrate, corerel_migrate_file, corerel_migrate_dir, __test_migrate
            macro mig(p)
                endswith(p, "/abc.rel") && return :( __test_migrate($p) )
                isdir(p) && return :( corerel_migrate_dir($p) )
                return :( corerel_migrate_file($p) )
            end
            macro migstr(str)
                return corerel_migrate(str)
            end
        end,
        ["set_dassert_level"] => :(using RelationalAIBase),
        ["v1", "f1", "db"] => quote
            using RAICode
            using RAICode.API
            db = API.create_database(;prefix="george")
            run(`say "work done"`)
            v1(args...; keyargs...) = query(db, args...; keyargs...)
            f1(path; keyargs...) = v1(read(path, String); keyargs...)
        end,
        ["pp"] => quote
            using RelationalAITypes
            function pp(dict::RelationalAITypes.RelDict)
                for (k, v) in dict
                    printstyled("\n", k, "\n"; color = :blue)
                    pp(v)
                end
            end

            function pp(vs::Vector)
                for v in vs
                    pp(v)
                    println()
                end
            end

            function pp(t::Tuple)
                for v in t
                    pp(v)
                    print("\t")
                end
            end

            function pp(x)
                print(x)
            end
        end,
        ["run_lqp"] => quote
            using LogicalQueryProtocol: Transaction, is_read_only
            using ProtoBuf
            using RAICode: Database

            function run_lqp(db, filename::String)
                # Read the file
                data = IOBuffer(read(filename))

                # Decode the transaction
                decoded = ProtoBuf.ProtoDecoder(data)
                txn = ProtoBuf.decode(decoded, Transaction)
                # println("decoded transaction: ", txn)

                Database.test_transaction(db; isreadonly=is_read_only(txn)) do txn_handle
                    rt = Database.salsa_runtime(txn_handle)

                    # Run the query
                    result = RAICode.LQPDriver.execute!(rt, txn)

                    # Show result
                    @show result
                    return result
                end
            end
        end,
    ])
end
