using SharedArrays
using JLD
using Distributed
addprocs(2)

@everywhere include("../examples/lorenz63.jl")
@everywhere function ergodic_average(rho)
	s = [10., rho, 8/3]
	n = 10000000
	n_runup = 5000
	z = 0.
	u = rand(3)
	u .= lorenz63(reshape(u,3,1), 
			s, n_runup)[end,:,1]
	for i = 1:n
		u .= next(u, s)
		z += u[3]/n
		if i==n
		  @time u .= next(u,s)
		end
	end
	return z-rho
end
function compute_erg_avg()
	n_p = 10
	rho = LinRange(24.0, 30., n_p)
	z_rho = SharedArray{Float64, 1}(n_p)
	t = @distributed for i = 1:n_p 
		@show i
		z_rho[i] = ergodic_average(rho[i])
	end
	wait(t)
	@show z_rho
	save("Jar.jld", "z_rho", z_rho)
	
end
