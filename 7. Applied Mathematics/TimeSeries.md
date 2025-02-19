### Autoregressive model (AR) - [link](https://en.wikipedia.org/wiki/Autoregressive_model)
AR(p) - the autoregressive model of the p'th order:

$$X_t = (\sum_{i=1}^p \alpha_i X_{t-i}) + \epsilon_t$$

Where $\alpha_i$ are the parameters of the model and $\epsilon_t$ is white noise, simply a normal random variable. The model can also be written as\

$$X_t = (\sum_{i=1}^p \alpha_i B^i X_{t}) + \epsilon_t$$

Where the addition $B^i$ is the backshift operator.

- For the model to be stationary, the roots of its characteristic polynomial must lie outside the unit circle.
- The augmented Dickey-Fuller test asses the stability of IMF and trend components.

**Characteristic polynomial**\
The autocorrelation function of an AR(p) process is:\
$$\rho(\tau) = \sum_{k=1}^p a_k y_k^{-\mid \tau \mid}$$\
Where $y_k$ are the roots of the polynomial:\
$$\phi(B) = 1 - \sum_{k=1}^p \alpha_k B^k$$\
Where B is the backshift operator, $\phi(*)$ is the function defining the autoregression and where $\alpha_k$ are the coefficients in the autoregression. The formula is valid only if all the roots have multiplicity 1.\

The autocorrelation function of an AR(p) process is a sum of decaying exponentials.
- Each real root contributes a component to the autocorrelation function that decays exponentially
- Similarly, each pair of complex conjugate roots contributes an exponentially damped oscillation.



#### Calculating of the AR Parameters
To estimate the AR parameters, one has to use the Yule-Walker Equations.

$$y_m = \sum_{k=1}^p \alpha_k y_{m-k} + \sigma_{\epsilon}^2 \delta_{m,0}$$

Where m= 0 ... p, yielding p+1 equations. Here $y_m$ is the autocovariance function of $X_t$, $\sigma_\epsilon$ is the standard deviation of the input noise process, and $\delta_{m,0}$ is the kronecker delta function.

Because the last part of an individual equation is non-zero only if m=0, the set of equations can be solved by representing the equations for m>0 in matrix form, thus getting the equation

$$\begin{bmatrix} y_1\\\ y_2 \\\ y_3 \\\ \vdots  \\\ y_p \\\ \end{bmatrix} = \begin{bmatrix} y_0 &  y_{-1} & y_{-2} & y_{-3} & \cdots  \\\ y_{1} & y_{0} & y_{-1} & y_{-2} & \cdots\ \\\
y_{2} & y_{1} & y_{0} & y_{-1} & \cdots\ \\\ y_{3} & y_{2} & y_{1} & y_{0} & \cdots\ \\\ \vdots  & \vdots  & \vdots  &  \vdots & \ddots \ \\\ y_{p-1} & y_{p-2} & y_{p-3} & y_{p-4} & \cdots\ \\\ \end{bmatrix} 
\begin{bmatrix} \alpha_1  \\\ \alpha_2 \\\ \alpha_3 \\\ \vdots \\\ \alpha_p \\\ \end{bmatrix} $$

With R - the stats package has the *ar* function and the *sarima* function\
With python - statsmodels.org hosts an AR model.

### Moving average model (MA)

MA(q) - The moving-average model of the q'th order:\

$$X_t = \mu + \epsilon_t (\sum_{i=1}^q \theta_i \epsilon_{t-i})$$

Where $\theta_i$ are the parameters of the model and $\mu$ is the expectation of $X_t$, and $\epsilon_i$ is white noise, simply normal random variable.

### Autoregressive moving average model (ARMA)

ARMA, autoregressive-moving-average(ARMA) models, are a way to describe weakly stationary stochastic processes. A tool for understanding a series and predicting future values.
Its components are the Autoregressive(AR) model and the moving average(MA) model

**ARMA(p,q), the model with p autoregressive terms and q moving-average terms.**

$$X_t = \epsilon_t + \sum_{i=1}^p \alpha_i X_{t-i} + \sum_{i=1}^q \theta_i \epsilon_{t-i}$$

Which also looks like this.

$$(1-\sum_{i=1}^p \alpha_i L^i ) X_i = (1+\sum_{i=1}^q \theta_i L^i ) \epsilon_t$$


The spectral density of an ARMA process is:
$$S(f) = \frac{\sigma^2}{2\pi}  \left | \frac{\theta(e^{-if})} {\phi(e^{-if})}\right | ^2$$
Where $\sigma^2$ is the variance of the white noise
$\theta$ is the characteristic polynomial of the moving average part
$\phi$ is the characteristic polynomial of the autoregressive part

#### Generalizations

One can add nonlinearity to either the autoregressive, moving average or entire process. 

One can also build out vector versions

Multivariate time series also exists

**ARIMA, Autoregressive integrated moving average models non-stationary time series**


if the polynomial $(1-\sum_{i=1}^p \alpha_i L^i)$ has a unit root (a factor (1-L)) of multiplicity d, then it can be rewritten as:
 $(1-\sum_{i=1}^p \alpha_i L^i)=(1-\sum_{i=1}^{p-d} \chi_i L^i)(1-L)^d$ 
We therefore rewrite $p'=p-d$ and have the generalization:

$$(1-\sum_{i=1}^{p'} \chi_i L^i)(1-L)^d X_t = \delta + (1+\sum_{i=1}^q \theta_i L^i ) \epsilon_t$$
Where drift $\frac{\delta}{1-\sum \alpha_i}$

ARCH, autoregressive conditional heteroskedasticity models time series with changes in variance over time.

SARIMA, seasonal ARIMA models periodic variation.

ARFIMA, autoregressive fractionally integrated moving average, exhibits long memory

MAR, multiscale AR is indexed by the nodes of a tree instead of integers.

ARMAX, autoregressive moving average model with exogenous inputs, is a model with an ARMA process, but also adding in exogenous inputs from an external time series $d_t$.

$$X_t = \epsilon_t + \sum_{i=1}^p \alpha_i X_{t-i} + \sum_{i=1}^q \theta_i \epsilon_{t-i} +\sum_{i=1}^b \eta_i d_{t-i}$$



### Autoregressive integrated moving average model (ARIMA)

### Autoregressive conditional heteroskedasticity model (ARCH)
https://en.wikipedia.org/wiki/Autoregressive_conditional_heteroskedasticity




### Fourier analysis


### Exponential smoothing
https://en.wikipedia.org/wiki/Exponential_smoothing#Basic_(simple)_exponential_smoothing

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



### Box-jenkins method
https://en.wikipedia.org/wiki/Box%E2%80%93Jenkins_method

### Augmented Dickey-Fuller test
https://en.wikipedia.org/wiki/Augmented_Dickey%E2%80%93Fuller_test

### Bayesian Information Criterion
https://en.wikipedia.org/wiki/Bayesian_information_criterion

### Akaike information Criterion
https://en.wikipedia.org/wiki/Akaike_information_criterion


### Score test
https://en.wikipedia.org/wiki/Score_test

### Least squares
https://en.wikipedia.org/wiki/Least_squares
least squares regression











### Volatility clustering
https://en.wikipedia.org/wiki/Volatility_clustering






