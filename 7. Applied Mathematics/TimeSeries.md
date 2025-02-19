





### Wold's decomposition/representation theorem
Every Covariance-stationary time series $Y_t$ can be written as the sum of two time series, one deterministic and one stochastic.

$$Y_t = \sum_{j=0}^\infty b_j \epsilon_{t-j} +\eta_t$$

**Where:**
- $Y_t$ is the time series being considered
- $\epsilon_t$ is an uncorrelated sequence which is the innovation process to the process $Y_t$ - that is, a white noise process that is input to the linear filter $\{ b_j \}$.
- $b$ is the possibly infinite vector of moving average weights ( Coefficients or parameters)
- $\eta_t$ is a "deterministic" time series, in the sense that if it is completely determined as a linear combination of its past values. It may include "determinisitic" terms like sine/cosine waves of t, but it is a stochastic process and it is also covariance-stationary, it cannot be an arbitrary deterministic process that violates stationarity.

**The moving average coefficients have these properties:**
1. Stable, that is, square summable $\sum_{j=i}^\infty \mid b_j\mid^2 < \infty$
2. Causal (i.e. there are no terms with j<0)
3. Minimum delay?
4. constant ($b_j$ independent of t)
5. It is convetional to define $b_0 = 1$
