using PyPlot
using JLD
X = load("../data/erg_avg/Jar1_res.jld")
z_rho = X["z_rho"].s
rho = X["rho"]
X = load("../data/erg_avg/Jar2_res.jld")
z_rho = [z_rho, X["z_rho"].s]
rho = [rho, X["rho"]]
z_rho = vcat(z_rho...)
rho = vcat(rho...)

X = load("../data/erg_avg/Jar3_res.jld")
z_rho = [z_rho, X["z_rho"].s]
rho = [rho, X["rho"]]

z_rho = vcat(z_rho...)
rho = vcat(rho...)

X = load("../data/erg_avg/Jar4_res.jld")
z_rho = [z_rho, X["z_rho"].s]
rho = [rho, X["rho"]]

z_rho = vcat(z_rho...)
rho = vcat(rho...)
