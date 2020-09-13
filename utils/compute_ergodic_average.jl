include("../examples/lorenz63.jl")
using SharedArray
function ergodic_average(rho)
	s = [10., rho, 8/3]
	n = 10000
	n_runup = 5000
	z = 0.
	u = rand(3)
	u = lorenz63(reshape(u,3,1), 
				 s, n_runup)[end,:,1]
	for i = 1:n
		u = next(u, s)
		z += u[3]/n
	end
	return z-rho
end
rho = LinRange(24.0, 30., 50)
z_rho = SharedArray
