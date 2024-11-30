**We are running tests on 6 months, 1 year and 3 years for Microsoft stocks**\
**We are expecting 0.5% brokerage fee on all transactions**\
**I have added my own unoptimized trading strategies**\
**We're running from the 13th of July 2024**

## Mean reversion

x-day simple moving average will be denounced X-SMA.\
x-day moving standard deviation will be denounced X-MSTD.

| Strategy | Sharpe | 6m-return | 1y-return | 3y-return |
| ------------- |-------------| -------------| -------------| -------------|
| 30-SMA & a-level | 0.43 | -0.3% | 4.79% | 2.68% |
| 52W high-low & SMA | 0.77 | NAN | NAN | 14.7% |
| RSI & SMA | -1.22 | NAN | -20.41% | -29.4% |
| 20 SMA & 2sigma | 0.56 | 0.6% | 6.3% | -0.96% |
| Z-scores | -1.82 | -0.6% | -20.4% | -39.2% |
| unoptimized 5-15-30 - 5y - 53%| 1.64 | 3.3% | 18.32% | 10.5% | 
| unoptimized 5-20-40 - 5y -  113.87%| 0.88 | 3.5% | 9.9% | 41.85% |



### Strategy 1 - [link](https://algocraft.xyz/how-to-get-131-return-with-mean-reversion-trading-strategy-from-stock-selection-to-backtesting-c623870adf31)

Calculate the 30-SMA and 30-MSTD of your close prices.
The A-factor has been set to 1%

**Note:** For this strategy 30-SMA = sum(prices(max[0, i - 30]:i) / min(i, 30) \
**Buy:** Close price < 30-SMA[-1] * (1 - A) \
**Sell:** Close price > 30-SMA[-1] * (1 + A)

### Strategy 2 - [link](https://wire.insiderfinance.io/mean-reversion-strategy-using-python-6dfed9ed988c)

For this strategy you should calculate the following: 
* 52-WL = 52 week low
* 52-WH = 52 week high
* 200-SMA
* diff = 52-WH - 52-WL
* Dist = Close price - 200-SMA

**Buy:** When the following conditions are met
1. (52-WL + diff * 0.2) < Close price < (52-WL + diff * 0.8)
2. Close price < 200-SMA
3. Dist is in the top 5 percentile

**Sell:** At take-profit or stop-loss.

### Strategy 3 - [link](https://eodhd.medium.com/testing-a-powerful-mean-reversion-trading-strategy-using-python-4eb5eed60857)
For this strategy you should calculate the following: 
* 200-SMA
* 10-RSI = NaN

**Buy:** 10-RSI < 30 and Close price > 200-SMA

**Sell:** 10-RSI > 70 and Close price < 200-SMA


### Strategy 4 - [link](https://machinelearning-basics.com/mean-reversion-trading-strategy-using-python/)

For this strategy you should calculate the following: 
* 20-SMA
* 20-MSTD
* diff = Close price - 20-SMA
* Z = diff/20-MSTD

**Buy:** Close price < 20-SMA - 2 * 20-MSTD 

**Sell:** Close price > 20-SMA + 2 * 20-MSTD 

### Strategy 5 - [link](https://gist.github.com/AnthonyFJGarner/ccd23f0e9d46214612f59c7b92a82149)

This strategy is a trailing purchase.
Whenever the buy signal is triggered, you purchase 1% of your maximum amount.
Whenever slippage happens you sell 1% of your maximum amount.

For this strategy you should calculate the following: 
* 10-SMA
* 100-SMA
* 10-MSTD
* diff = Close price - 10-SMA
* Z = diff/10-MSTD

**Buy:** (Z(i-1) > 0.5 and Z(i) < -0.5) or (Z(i-1) < -0.5 and Z(i) > 0.5)

**Sell:** Z(i) > 1 and 10-SMA < 100-SMA\
Z(i) < -1 and 10-SMA > 100-SMA\
Z(i) < 0.5

### Unoptimized MBZ Strat - Private
* 5-SMA
* 15-SMA
* 30-SMA

**Buy:** \
Close > 5-SMA\
5-SMA < 15-SMA\
15-SMA < 30-SMA\
**Sell:**\
Close > 5-SMA\
5-SMA > 15-SMA\
15-SMA > 30-SMA

### Optimized MBZ Strat - Private
* 5-SMA
* 20-SMA
* 40-SMA

**Buy:** \
Close > 5-SMA\
5-SMA < 20-SMA\
20-SMA < 40-SMA\
**Sell:**\
Close > 5-SMA\
5-SMA > 20-SMA\
20-SMA > 40-SMA

**Note to self**
on short periods it seems 5-15-30 works better.
But on longer periods 5-20-40 works better.
There should be a way to optimized the shift between the two.
Also it is noted that this strategy losses money on dumb situations.
Which could be optimized with a min-max approach.


## Trend following

| Strategy | Sharpe | 6m-return | 1y-return | 3y-return |
| ------------- |-------------| -------------| -------------| -------------|
| mean return - unopt| 0.29 | 3% | 3.26% | -7.9% |
| mean return - 1. opt| 3.32 | 12.9% | 37.16% | 57.5% |
| mean return - 2. opt| 3.21 | 14.26% | 35.9% | 63.4% |
| pos/neg counter | 2.9 | 13.9% | 32.5% | 93% |



### mean return - unoptimized - private collection
This strategy is a very sad idea from me, it performs just about at the minimum positive level.\

**buy:** if mean-return > 0.005 and return[-1] < 0.01 and return[-2] < 0.02:\
**sell:** if buy_signal is true and return[-1] > 0 and return[-2] > 0:

**short-sell:** mean return < -0.01 and short_sell is false:\
**Close short-sell:** if mean-return > 0 and return[-2] > 0 and short_sell is true:

### mean return - 1. optimization - private collection
* 30 day mean of returns
* 30 day autocorrelation cofficients
  
**buy:**
  
mean return < mean of all returns in the period.\
Close price < 102% of 30day SMA\
Close price > Close price[-1]

**sell:**
Autocorrelation > 0.96\
or\
Close price > 103.5% of 30day SMA

### mean return - 2. optimization - private collection
Need to correct buy, to only buy at the first indication of a upward trend\
Need to correct sell, to only sell at the maximum or close to the maximum, not on the slant.\

* 30 day mean of returns
* 30 day autocorrelation cofficients

**buy:**
  
mean return < mean of all returns in the period.\
Close price < 97% of 30day SMA\
Close price > Close price[-1]

**sell:**\
Autocorrelation > 0.96\
or\
Close price > 120% of 30day SMA

### mean return - 3. optimization - private collection
Need to correct buy, to only buy at the first indication of a upward trend\
Need to correct sell, to only sell at the maximum or close to the maximum, not on the slant.

### postive/negative counter - extremely unoptimized - private collection
This strategy performs very badly on this scenario, as it trades frequently, but expects very low brokerage fee.
* pos-neg = produces a list of the sign of a given days return
* E10(pos-neg) = 10 day average of pos-neg
* E30(pos-neg) = 30 day average of pos-neg

**buy:** pos-neg > E10(pos-neg) and the pos-neg[-1] > E10(pos-neg).\
**sell:** signal[-1] = Buy and return < 0.

**short sell:** if pos-neg < E30(pos-neg).\
**close short-sell:** signal[-1] = Short-sell and return > 0.

### postive/negative counter - 1. Optimization - private collection
This strategy performs very badly on this scenario, as it trades frequently, but expects very low brokerage fee.
* pos-neg = produces a list of the sign of a given days return

**buy:** E2(pos-neg) < 0 and Close price > Close price[-1] and Close price < E5-2(Close Price)\
Or\
E10(pos-neg) > 0

**sell:** E10(pos-neg) > 0 and Close price < Close price[-1] and time distance to last buy > 2

**Notes:** Downtrends are a weakness.

### Strategy 3


## Min-max
| Strategy | Sharpe | 6m-return | 1y-return | 3y-return |
| ------------- |-------------| -------------| -------------| -------------|
| local min(-1) - local max(-1) - V1 | 1.78 | 6.4% | 20% | 28.6% |
| local min(-1) - local max(-1) - V2 | 1.8 | 4.2% | 20.24% | 43.4% |
| 0-Tangent - V1 | 2.21 | 5.37% | 24.8% | 80.8% |
| 0-Tangent - V2 | 1.03 | 6.7% | 11.5% | 89.4% |


### Min-Max - V1 unoptimized - private collection

    if data['value'][i] <= 1.001 * min(data['value'][i-30:i]):
        data['buy_signal'][i] = True
    
    # generate short/sell signal
    if data['value'][i] >= 0.999 * max(data['value'][i-30:i]):
        data['sell_signal'][i] = True

### Min-Max - V2 unoptimized - private collection

    if data['value'][i] <= 1.001 * min(data['value'][i-5:i]) and data['value'][i] < np.mean(data['value'][i-10:i]) and np.mean(data['returns'][i-3:i]) < 0  :
        if data['returns'][i] > data['returns'][i-1] and data['returns'][i] > -0.005:
            if np.mean(data['returns'][i-2:i]) > -0.04:
                data['buy_signal'][i] = True
                buy = True
                k = i
    
    
    
    # generate short/sell signal
    if data['value'][i] >= 1.01 * max(data['value'][i-7:i-2]) and data['value'][i] < data['value'][i-1] :
        data['sell_signal'][i] = True
    
    elif data['value'][i] < 0.96 * data['value'][k]:
        data['sell_signal'][i] = True



### 0-Tangent - V1 unoptimized - private collection

    # generate long/buy signal  
    if data['returns'][i] >= -0.01 and data['returns'][i] <= 0.01 and np.mean(data['returns'][i-5:i]) < -0.01:
        data['buy_signal'][i] = True
    
    if data['sell_signal'][i-1] and data['returns'][i] > 0:
        data['buy_signal'][i] = True
    
    # generate short/sell signal
    if data['returns'][i] <= -0.005 and np.mean(data['returns'][i-5:i]) > 0:
        data['sell_signal'][i] = True

### 0-Tangent - V1 unoptimized - private collection

    # generate long/buy signal  
    if data['returns'][i] >= -0.01 and data['returns'][i] <= 0.01 and np.mean(data['returns'][i-5:i]) < -0.0005 and data['RSI'][i] < 36:
        data['buy_signal'][i] = True
        
    elif data['value'][i] > 1.02 * data['value'][k]:
        data['buy_signal'][i] = True
        
    # generate short/sell signal
    if data['returns'][i] <= 0 and np.mean(data['returns'][i-5:i]) > 0 and data['RSI'][i] > 74:
        data['sell_signal'][i] = True
        k = i
        
    elif data['RSI'][i] > np.mean(data['RSI'][i-5:i]) and data['value'][i] > np.mean(data['value'][i-5:i]) and data['RSI'][i] < 75 and data['RSI'][i] > 65:
    #elif data['returns'][i] >= 0 and data['value'][i] > 1.02 * data['value'][i-1] and data['RSI'][i] > 70:
        data['sell_signal'][i] = True



## Sigma Strategies
| Strategy | Sharpe | 6m-return | 1y-return | 3y-return |
| ------------- |-------------| -------------| -------------| -------------|
| 1.5-sigma - price| 0.47 | 0.63% | 5.27% | -5.9% |
| 2-sigma - price | 0.56 | 0.63% | 6.3% | -1.9% |
| 2.5-sigma - price** | 0.85 | 9.5% | 9.5% | 62.49% |
| 3-sigma - price | 0 | 0% | 0% | 15.72% |
| 1.5-sigma - return| -2.35 | -21.6% | -26.3% | -68.27% |
| 2-sigma - return | -2.03 | -18.4% | -22.8% | -28.2% |
| 3-sigma - return | -2.15 | -17.5% | -24.1% | 1.9% |
| 90% VaR - price| 0.86 | 2.8% | 9.6% | 10.5% |
| 95% VaR - price| 0.89 | 4.8% | 10% | 5.8% |
| 99% VaR - price| 1.09 | 4.8% | 12.2% | 13.2% |
| 90% VaR - Return| -1.66 | -10.3% | -18.6% | -72.5% |
| 95% VaR - Return| -1.09 | 2.4% | -12.2% | -42.88% |
| 99% VaR - Return| 1.76 | -4% | 19.7% | 3% |


#### Bollinger band

**1.5 sigma - price**\
Close < 1.5 sigma of 30-bollinger - buy\
Close > 1.5 sigma of 30-bollinger - sell

**2 sigma - price**\
Close < 2 sigma of 30-bollinger - buy\
Close > 2 sigma of 30-bollinger - sell

**2.5 sigma - price**\
This is a key part of the rumours I've heard of [Two Sigma](https://www.twosigma.com/) trading strategy.\
Close < 2.5 sigma of 30-bollinger - buy\
Close > 2.5 sigma of 30-bollinger - sell

**3 sigma - price**\
There aren't enough situations to fill both buy and sell orders.\
Hence no sharpe, 6 month return and 1 year return.\
This may indicate a need for optimization on time interval.\
Close < 3 sigma of 30-bollinger - buy\
Close > 3 sigma of 30-bollinger - sell

**1.5 sigma - return**\
return < 1.5 sigma of 30-bollinger - buy\
return > 1.5 sigma of 30-bollinger - sell

**2 sigma - return**\
return < 2 sigma of 30-bollinger - buy\
return > 2 sigma of 30-bollinger - sell

**3 sigma - return**\
return < 3 sigma of 30-bollinger - buy\
return > 3 sigma of 30-bollinger - sell

#### VaR

**90% VaR - price**\
Close < 10% 30quantile - buy\
Close > 90% 30quantile - sell

**95% VaR - price**\
Close < 5% 30quantile - buy\
Close > 95% 30quantile - sell

**99% VaR - price**\
Close < 1% 30quantile - buy\
Close > 99% 30quantile - sell

**90% VaR - return**\
return < 10% quantile - buy\
return > 90% quantile - sell

**95% VaR - return**\
return < 5% quantile - buy\
return > 95% quantile - sell

**99% VaR - return**\
return < 1% quantile - buy\
return > 99% quantile - sell




### Strategy 1 - unoptimized - private collection
This strategy is a very sad idea from me, it performs just about at the minimum positive level.\

**buy:** if mean-return > 0.005 and return[-1] < 0.01 and return[-2] < 0.02:\
**sell:** if buy_signal is true and return[-1] > 0 and return[-2] > 0:\

**short-sell:** mean return < -0.01 and short_sell is false:\
**Close short-sell:** if mean-return > 0 and return[-2] > 0 and short_sell is true:


## Markov probabilities
| Strategy | Sharpe | 6m-return | 1y-return | 3y-return |
| ------------- |-------------| -------------| -------------| -------------|
| Simple Markov | a | 3% | 3.26% | -7.9% |
| Markov - filtered | a | -65.4% | -159% | -258.66% |


### Strategy 1 - unoptimized - private collection
This strategy is a very sad idea from me, it performs just about at the minimum positive level.\

**buy:** if mean-return > 0.005 and return[-1] < 0.01 and return[-2] < 0.02:\
**sell:** if buy_signal is true and return[-1] > 0 and return[-2] > 0:\

**short-sell:** mean return < -0.01 and short_sell is false:\
**Close short-sell:** if mean-return > 0 and return[-2] > 0 and short_sell is true:



## Pairs trading
https://letianzj.github.io/cointegration-pairs-trading.html
https://github.com/edgetrader/mean-reversion-strategy/blob/master/notebook/mean-reversion-strategy.ipynb



### Strategy 2 - [link](https://machinelearning-basics.com/mean-reversion-trading-strategy-using-python/)

For this strategy you should calculate the following: \
* Spread in price between asset A and asset B.
* 20-SMA of spread
* 20-MSTD of spread
* diff = Close price - 20-SMA
* Z = diff/20-MSTD

**Buy:** Close price < 20-SMA - k * 20-MSTD 

**Sell:** Close price > 20-SMA + k * 20-MSTD 

Works best when k > 1.5\











# 0-Tangent, VaR, Min-Max, Pos-Neg counter and Markov Model combined

if extreme outcome. 
Stop and sell.
wait till back to normal.

if down-trend
short

if up-trend
long

if no-trend
mean reversion





# Mathematical model
The three axiomatic hypothesis

## Optimal positions

### Optimal position in down-trending markets
*Given a down-trending market.\
It will be unprofitable to run a long position.\
But it will be profitable to run a short position.*

### Optimal positions in flat-trending markets
*Given a flat-trending market.\
it will be profitable to run long positions on upwards slopes.\
For which a sale should occur at a profitable point after a change in direction.\
But it will also be profitable to run a short position on downwards slopes.\
For which a close of position should occur at a profitable point after a change in direction.*

### Optimal position in up-trending markets
*Given an up-trending market.\
It will be profitable to run a long position.\
But it will be unprofitable to run a short position.*

## movements

### Hypothesis on the direction reversal effect
*Given any market state, reversals of the direction of returns will occur.\
The likelihood of a reversal occurring increases as the asset price approaches a “limit”.\
In flat market states, the likelihood of a reversal occurring is significantly higher than in any other market. In approaching an all-time high or an annual high the likelihood increases.*

### The extremal event reversal hypothesis
*Given any market state and the occurrence of an extremal event.\
The likelihood of a reversal occurring increases from above 75% to 97% in step with the size of the extremal outcome and the number of continuous days following the same direction of return as the extremal outcome.*

### Hypothesis on the occurrence of spontaneous changes in the direction of returns
*Given any market state, spontaneous changes may occur in the direction of returns.\
The reasons for such can vary and even though some reasons are more systematic, changes may occur for the simplest and most irrational of reasons.\
The time horizon of changes taking effect may also vary from minutes to months.*

### Buffett’s theorem on the intrinsic invariant value of a financial asset
*Given an asset and a market state. \
An intrinsic invariant value can be obtained for the asset, given the current market state.\
The corresponding value movements will either be approaching- or move in a mean reversion process around the intrinsic invariant value.*

### The bid-ask conundrum
*Given any asset, financial or otherwise.\
The bidder holds the objective of buying the asset at the lowest price.\
The asker holds the objective of selling the asset at the highest price.\
 \
Given a financial market, another complexity is added to this feature.\
A bidder may also hold the objective of buying the asset at the lowest price, trending upwards.\
While the asker may also hold the objective of selling the asset at the highest price, trending downwards.\
Both are looking to minimize risk towards a proposed future event. An up-trending market and a down trending market.*

### The supply-demand conundrum

## Market mechanics

### The market participant hypothesis
Given a market with k participants.
The market winner, will be the participant m, whose return is the market maximum after costs.
In this framework, neither risk, probabilities nor time horizons are considered.

### The Second market participant hypothesis
Given a market with k participants.
The market winners, will be the participants m_i through to m_n, whose returns are above market mean after costs.
In this framework, neither risk, probabilities nor time horizons are considered.
The path of least resistance vs the path of least time problem for financial markets
Given a market with k participants.
Each market participant decides at time t = 0, whether to follow a path of least resistance or a path of least time.
After each choice has been made, a success-score will be given to each participant.
	For participants following the path of least resistance, returns will follow a normal distribution, with mean 0 and standard deviation σ_polr
	For participants following the path of least time, returns will follow a normal distribution with mean μ_polt>0 and standard deviation σ_polt>σ_polr.
The market winners will be the participants m_i through to m_n, whose returns are above market mean after costs.
In this framework risk, probabilities and time horizons have been considered.

### The market impact hypothesis
Given a market participant m, if the market volume of m exceeds x% of the market volume within the time horizon [y:z]. Then m runs a risk of affecting the asset price adversely.
To minimize the market impact, m can employ a trailing order.

### The minimal information geometry hypothesis
Given n market participants.
If no trades have occurred from time t = 0 to time t = T. The first trade occurring by participant m, at time t = T+1. Spreads information of m’s supply-demand relationship on the chosen asset.
This information can be used by competitors to gauge possible parasitic trades on m.

### The absolute information geometry hypothesis
Given n market participants.
The trades occurring by participant m, at time t = T. Spreads information of m’s supply-demand relationship on a chosen asset. This information can be used by competitors to gauge possible parasitic trades on m’s position.
	If participant m, buys stock A at time T, then participant m* can buy Stock A at time T+1.
	If participant m, holding Stock A, sells A at time T2, then participant m* can sell stock A at time T2.


## The Signal Theorem.
Given any financial asset, market and time horizon. 
A signal is a proposed repeated pattern occurring given certain conditions, the effect of which is either a certain price movement or adjustment of significant variable.
Signals have varying levels of certainty.
Mathematical signals and fundamental signals can be combined and build into trading strategies.



$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$



0. Build your ideal state strategy. Where if in this state you will earn as much as possible.
1. Detect market state and opponent positions. - Because in general you're just playing against the market, but you're also playing against specific opponents.
2. Match market state with tactic to progress towards strategic goal points. - For each market state, there's a series of actions you can perform to go to your ideal state.
3. Decide on counter-measure or alignment-measure. - Depending on whether you're progressing towards your ideal state or moving away, you can take actions to move towards it again.
   a. If counter-measure, decide on size, direction, time and method
   b. If alignment-measure, decide on size, direction, time and method.
6. Proceed to optimal execution, considering market impact, timing and cost. - To best progress towards your ideal state, you can try to minimize cost or consider the best steps.

**possible improvements**
1. Run Leveraged trades
2. Run options, futures and swaps
3. Run multiple asset types: Crypto, equity, derivatives, commodities
4. Algorithmic trading on medium time horizons
5. HFT - market making
6. Investing and venture capital on a long time horizon
7. Banking insurance and pension
8. Robotics, IT and resource development
9. energy




# Macrostrategy

## Detect Market state

* What is the current trend state?\
**Question:**\
How precise is the mean return functional at detecting the trend?\
How precise is the positive-negative functional at detecting the trend?\
How precise is the battery of statistical tests at detecting the trend?

* What is the current risk state?\
**Question:**\
What's the current volatility states?\
What's the current connectability in the market?\
What are the current probability states?

* Has an extremal event occured?\
**Question:**\
How precise is Bollinger bands of 1.5, 2 or 2.5 sigma at detecting Extremal events?\
How precise is the 10%, 5% and 1% quantile of xyz-interval returns at detecting Extremal events?\
How precise is the 10%, 5% and 1% quantile of xyz-interval prices at detecting Extremal events?

## Match corresponding strategy

* If Up trend:\
*run long between 0-tangents, to minimize risk of loss*

1. Check for Extremal events \
   If Negative Extremal event occurs - Close trades, take loss. Halt trading\
   If Positive Extremal event occurs - Close trades, take profit. Gauge trading
2. Check for Divergence and weight of closed trades.\
   If open, high and low diverge over time.\
   Consider whether a high volatility period is ahead and how to benefit on buying low and selling high.\
   If the the weight of the closing trades are significant and a certain direction has been chosen.\
   Consider whether to play along the direction or to take profit before a direction change.
3. Check for moment and moment drift

* If Down trend:\
*run short between 0-tangets, to minimize risk of loss*

1. Check for Extremal events \
   If Negative Extremal event occurs - Close trades, take loss. Halt trading\
   If Positive Extremal event occurs - Close trades, take profit. Gauge trading
2. Check for Divergence and weight of closed trades.\
   If open, high and low diverge over time.\
   Consider whether a high volatility period is ahead and how to benefit on buying low and selling high.\
   If the the weight of the closing trades are significant and a certain direction has been chosen.\
   Consider whether to play along the direction or to take profit before a direction change.
3. Check for moment and moment drift

* If Flat trend:\
*run long between 0-tangents, to minimize risk of loss*\
*run short between 0-tangets, to minimize risk of loss*

1. Check for mean reversion indications\
   If the 6, 20 and 40 day moving averages cross\
   If the average directional index changes\
   If the trend indicators change\
   If the autocorrelation indicator increases
2. Check for Resistance levels
   If the Price reaches a previous resistance level - concrete price
   If the price reaches a fibonacci level - mythical & mystical price level
   If the price drops by x% from a previous max or min
3. Check for Breakthrough signals
   *Unsure how to check this at the moment*

* If unknown trend:\
*Wait till a clear trend manifests*


## Implement trading strategy

### If - Up trend

**Entry:**\
**Exit:**


### If - Down trend

**Entry:**\
**Exit:**

### If - Flat trend

**Entry:**\
**Exit:**

### If - Extremal event

**Entry:**\
**Exit:**


## Optimal executions

### Up trend

**Entry:**\
**Exit:**

### Down trend

**Entry:**\
**Exit:**

### Flat trend

**Entry:**\
**Exit:**









# Research

DATASET - Price
Timestamp+Date
Open
High
Low
Close
Volume
Returns_C

DATASET - Options



## Markov model/Decision Tree Research
**Goal**: Determine the sign of tomorrows return, from today's Markov State.
1. Train the model on n > 25 datasets.\
   a. Sort dataset by conditions. *for us this is up MA-cross and down MA-cross* - This has to be researched further.\
   b. Add column with "Up" or "Down" indicators. Indicating the sign of the day's return.\
   c. Add column with indicator combinations of 3 and 5, such as "UUU", "DDD" and "UUUUU", "DDDDD".\
   d. Calculate the probabilities of next day return signs for each indicator combination. 
2. Test the model, with the goal of achieving x >= 65% accuracy.\
   a. The current mean accuracy is 55% ... 
3. If the result is x < 65% -> than there exists hidden variables.
   a. There must exist hidden variables, unaccounted for in moving averages 

## Hidden Markov model Research
**Goal**: Determine the trend, volatility, acceleration and sentiment states for tomorrow.\
From a dataset on an asset. Determine the combined state for each timestep.\
**Question**: How will I make the system decide on a given state?\
Given 4 trends states: Up, Down, Flat, Unknown.\
Given 4 volatility states: Extreme, high, medium, low.\
Given 4 acceleration states: increasing, decreasing, neutral, Unknown.\
Given 4 sentiment states: Positive, Negative, Neutral, Unknown.

## Mean reversion Research
**Goal**: For periods where Mean Reversion is valid, what is the best method for earning?\
What method is best at predicting mean reversions?
1. MA5, MA20, MA40
2. MACD
3. A combination?


## Convergence Theorem Research
**Goal**: Determine the convergence or divergence states for high, low and close prices
1. Calculate convergence or divergence of highs
2. Calculate convergence or divergence of lows
3. Calculate convergence or divergence of close
<br>
What can this be used for? Market states, 0-tangents?

## Linear Regression Research

## Standard Deviation Research
Can you always or nearly always expect an opposite and equal force, when experiencing an 2-sigma, 2.5-sigma or 3-sigma event?

## Mean Field Games Research

## Technical Indicators Research

## Expectation Maximation Research

## 0-tangent Research
How do i best measure 0-tangents, vendetangenter?

f(x) = Price
f'(x) = returns
f'(x) = 0?



# Event based HFT
When Token X goes from Pumpfun to Raydium. Buy with HFT and sell.
[Pumpfun](https://pump.fun/board)
raydium?
[dexscanner](https://dexscreener.com/)
Jito fees?
spamming/crowding

Sandwich/MEV bot

KuCoin

# Other
lgb, xgb, catboost
https://www.kaggle.com/code/aimind/bottleneck-encoder-mlp-keras-tuner-8601c5

Cross-Validation (CV) Strategy and Feature Engineering:

5-fold 31-gap purged group time-series split
Remove first 85 days for training since they have different feature variance
Forward-fill the missing values
Transfer all resp targets (resp, resp_1, resp_2, resp_3, resp_4) to action for multi-label classification
Use the mean of the absolute values of all resp targets as sample weights for training so that the model can focus on capturing samples with large absolute resp.
During inference, the mean of all predicted actions is taken as the final probability
Deep Learning Model:

Use autoencoder to create new features, concatenating with the original features as the input to the downstream MLP model
Train autoencoder and MLP together in each CV split to prevent data leakage
Add target information to autoencoder (supervised learning) to force it to generate more relevant features, and to create a shortcut for backpropagation of gradient
Add Gaussian noise layer before encoder for data augmentation and to prevent overfitting
Use swish activation function instead of ReLU to prevent ‘dead neuron’ and smooth the gradient
Batch Normalisation and Dropout are used for MLP
Train the model with 3 different random seeds and take the average to reduce prediction variance
Only use the models (with different seeds) trained in the last two CV splits since they have seen more data
Only monitor the BCE loss of MLP instead of the overall loss for early stopping
Use Hyperopt to find the optimal hyperparameter set


https://www.kaggle.com/competitions/optiver-realized-volatility-prediction/discussion/274970
https://www.kaggle.com/competitions/optiver-trading-at-the-close/discussion/487446
https://www.kaggle.com/competitions/jane-street-market-prediction/discussion/224348







# strategies

Spectral methods, finite difference methods, nonhomogenous gaussian regression, galerkin methods

**Momentum**
Buy if stock is going up and sell at a certain threshold

**Mean reversion**
temporal nature of high low of asset prices. The returns to the mean.
The challenge is to identify when this happens.

**Trend following**
following trends in the stock price movement.
Range breakouts, volume profile skews, volatility jumps. 
Simple moving average crossover. short ma surpass long ma. This means buy, if inverse than sell.


fair value gap?

**RSI IND**
RSI and daily close. Buy at RSI > 30 and daily close is above 70% of highest close in last 50 bars.
Sell at RSI < 70 and daily close is below 130% of lowest close in last 50 bars.


**RSI DIV**
RSI Divergences can be identified as possible Bullish reversal areas when the RSI is making higher low points while
the price is making lower low points.
RSI Divergences can be identified as possible Bearish reversal areas when the RSI is making lower high points while
the price is making higher high points.

cumulative volume delta. A relative upward spike in CVD is created when
there is a large increase in buying vs a low amount of selling. A relative downward spike in CVD is created when
there is a large increase in selling vs a low amount of buying.

**VWAP**
How it does it:
1 VWAP Calculation: The script calculates the VWAP using either standard deviation or average deviation over a specified length. It then plots the VWAP and its upper and lower deviation bands.
2 OBV RSI Calculation: It computes the OBV and then calculates the RSI using the cumulative changes in OBV. The RSI is plotted and compared against predefined levels.
3 Table Visibility and Occurrence Counting: It allows the user to display a table showing the number of occurrences where the price is above Upper Dev 2, below Lower Dev 2, crosses above a higher RSI level, or crosses below a lower RSI level.
4 Entries: Long and short entry conditions are defined based on the position of the price relative to the VWAP deviation bands and the color of the OBV RSI. Entries are made when specific conditions are met, and there hasn't been a recent entry.
5 Exit Conditions: The script includes stop-loss and take-profit mechanisms. It exits positions based on price crossing the VWAP or a certain percentage, and it prevents further trading after a certain number of consecutive losses.

What traders can use it for:
Trend Identification: Traders can use the VWAP and its deviation bands to identify potential trend reversals or continuations.
Volume Confirmation: The inclusion of OBV RSI provides confirmation of price movements based on volume changes.
Entry and Exit Signals: The script generates buy and sell signals based on the specified conditions, allowing traders to enter and exit positions with defined stop-loss and take-profit levels.
Statistical Analysis: The visibility of occurrence counts in the table allows traders to perform statistical analysis on the frequency of price movements relative to the VWAP and OBV RSI levels.

**MVRV Z-score**

 Strategy, How It Works: Detailed Explanation

The strategy leverages the Market Value to Realized Value (MVRV) Z-Score, specifically designed for cryptocurrencies, with a focus on Bitcoin. This metric is crucial for determining whether Bitcoin is currently undervalued or overvalued compared to its historical 'realized' price. Below is an in-depth explanation of the strategy's components and calculations.

🔶Conceptual Foundation

- Market Capitalization (MC): This represents the total dollar market value of Bitcoin's circulating supply. It is calculated as the current price of Bitcoin multiplied by the number of coins in circulation.
- Realized Capitalization (RC): Unlike MC, which values all coins at the current market price, RC is computed by valuing each coin at the price it was last moved or traded. Essentially, it is a summation of the value of all bitcoins, priced at the time they were last transacted.
- MVRV Ratio: This ratio is derived by dividing the Market Capitalization by the Realized Capitalization (The ratio of MC to RC (MVRV Ratio = MC / RC)). A ratio greater than 1 indicates that the current price is higher than the average price at which all bitcoins were purchased, suggesting potential overvaluation. Conversely, a ratio below 1 suggests undervaluation.

🔶 MVRV Z-Score Calculation

The Z-Score is a statistical measure that indicates the number of standard deviations an element is from the mean. For this strategy, the MVRV Z-Score is calculated as follows:

MVRV Z-Score = (MC - RC) / Standard Deviation of (MC - RC)

This formula quantifies Bitcoin's deviation from its 'normal' valuation range, offering insights into market sentiment and potential price reversals.

🔶 Spread Z-Score for Trading Signals

The strategy refines this approach by calculating a 'spread Z-Score', which adjusts the MVRV Z-Score over a specific period (default: 252 days). This is done to smooth out short-term market volatility and focus on longer-term valuation trends. The spread Z-Score is calculated as follows:

Spread Z-Score = (Market Z-Score - MVVR Ratio - SMA of Spread) / Standard Deviation of Spread

Where:
- SMA of Spread is the simple moving average of the spread over the specified period.
- Spread refers to the difference between the Market Z-Score and the MVRV Ratio.

🔶 Trading Signals

- Long Entry Condition: A long (buy) signal is generated when the spread Z-Score crosses above the long entry threshold, indicating that Bitcoin is potentially undervalued.
- Short Entry Condition: A short (sell) signal is triggered when the spread Z-Score falls below the short entry threshold, suggesting overvaluation.

These conditions are based on the premise that extreme deviations from the mean (as indicated by the Z-Score) are likely to revert to the mean over time, presenting opportunities for strategic entry and exit points.

**Leverage sentiment**
█ Strategy, How It Works: Detailed Explanation

🔶 Data Collection and Ratio Calculation

Firstly, the strategy acquires data on leveraged long (**`priceLongs`**) and short positions (**`priceShorts`**) for Bitcoin. The primary metric of interest is the ratio of long positions relative to the total of both long and short positions:

BTC Ratio=priceLongs / (priceLongs+priceShorts)

This ratio reflects the prevailing market sentiment, where values closer to 1 indicate a bullish sentiment (dominance of long positions), and values closer to 0 suggest bearish sentiment (prevalence of short positions).

🔶 Z-Score Calculation

The Z-Score is then calculated to standardize the BTC Ratio, allowing for comparison across different time periods. The Z-Score formula is:

Z = (X - μ) / σ

Where:

- X is the current BTC Ratio.
- μ is the mean of the BTC Ratio over a specified period (**`zScoreCalculationPeriod`**).
- σ is the standard deviation of the BTC Ratio over the same period.

The Z-Score helps quantify how far the current sentiment deviates from the historical norm, with high positive values indicating extreme bullish sentiment and high negative values signaling extreme bearish sentiment.

🔶 Signal Generation: Trading signals are derived from the Z-Score as follows:

Long Entry Signal: Occurs when the BTC Ratio Z-Score crosses above the thresholdLongEntry, suggesting bullish sentiment.
- Condition for Long Entry = BTC Ratio Z-Score > thresholdLongEntry

Long Exit/Short Entry Signal: Triggered when the BTC Ratio Z-Score drops below thresholdLongExit for exiting longs or below thresholdShortEntry for entering shorts, indicating a shift to bearish sentiment.
- Condition for Long Exit/Short Entry = BTC Ratio Z-Score < thresholdLongExit or BTC Ratio Z-Score < thresholdShortEntry

Short Exit Signal: Happens when the BTC Ratio Z-Score exceeds the thresholdShortExit, hinting at reducing bearish sentiment and a potential switch to bullish conditions.
- Condition for Short Exit = BTC Ratio Z-Score > thresholdShortExit

🔶Implementation and Visualization: The strategy applies these conditions for trade management, aligning with the selected trade direction. It visualizes the BTC Ratio Z-Score with horizontal lines at entry and exit thresholds, illustrating the current sentiment against historical norms.


**MA HTF**
Moving Averages (MA) Crossover for Entry:
Long Entry: A long entry signal is triggered when the moving average line 1 crosses above the moving average line 2. This crossover indicates a potential shift in market sentiment towards the upside. However, to validate this signal, the strategy checks if the moving average 3 on a higher time frame (eg. 4 hour) is in an upward trend. This additional filter ensures that the trade aligns with the prevailing trend on a broader time scale, increasing the probability of success.

Short Entry: Conversely, a short entry signal occurs when the moving average line 1 crosses below the moving average line 2. This crossover suggests a possible downturn in market momentum. However, for a short trade to be confirmed, the strategy verifies that the moving average 3 on the higher time frame is in a downward trend. This confirmation ensures that the trade is in harmony with the overarching market direction.

Exit from Long Position: The strategy triggers an exit signal from a long position when the moving average line 1 crosses below the moving average line 2. This crossover indicates a potential reversal in the market trend, prompting the trader to close their long position and take profits or minimize losses.

Exit from Short Position: Similarly, an exit signal from a short position occurs when the moving average line 1 crosses above the moving average line 2. This crossover suggests a potential shift in market sentiment towards the upside, prompting the trader to exit their short position and manage their risk accordingly.

**Fourier Smoothed Hybrid Volume Spread Analysis**
The Fourier Smoothed Hybrid Volume Spread Analysis (FSHVSA) Strategy/Indicator is an innovative trading tool designed to fuse volume analysis with trend detection capabilities, offering traders a comprehensive view of market dynamics.

This Strategy/Indicator stands apart by integrating the principles of the Discrete Fourier Transform (DFT) and volume spread analysis, enhanced with a layer of Fourier smoothing to distill market noise and highlight trend directions with unprecedented clarity.

This smoothing process allows traders to discern the true underlying patterns in volume and price action, stripped of the distractions of short-term fluctuations and noise.

The core functionality of the FSHVSA revolves around the innovative combination of volume change analysis, spread determination (calculated from the open and close price difference), and the strategic use of the EMA (default 10) to fine-tune the analysis of spread by incorporating volume changes.

Trend direction is validated through a moving average (MA) of the histogram, which acts analogously to the Volume MA found in traditional volume indicators. This MA serves as a pivotal reference point, enabling traders to confidently engage with the market when the histogram's movement concurs with the trend direction, particularly when it crosses the Trend MA line, signalling optimal entry points.

It returns 0 when MA of the histogram and EMA of the Price Spread are not align.

WHAT IS FSHVSA INDICATOR:

The FSHVSA plots a positive trend when a positive Volume smoothed Spread and EMA of Volume smoothed price is above 0, and a negative when negative Volume smoothed Spread and EMA of Volume smoothed price is below 0. When this conditions are not met it plots 0.

HOW TO USE THE STRATEGY:

Here you fine-tune the inputs until you find a combination that works well on all Timeframes you will use when creating your Automated Trade Algorithmic Strategy. I suggest 4h, 12h, 1D, 2D, 3D, 4D, 5D, 6D, W and M.

ORIGINALITY & USEFULNESS:

The FSHVSA Strategy is unique because it applies DFT for data smoothing, effectively filtering out the minor fluctuations and leaving traders with a clear picture of the market's true movements. The DFT's ability to break down market signals into constituent frequencies offers a granular view of market dynamics, highlighting the amplitude and phase of each frequency component. This, combined with the strategic application of Ehler's Universal Oscillator principles via a histogram, furnishes traders with a nuanced understanding of market volatility and noise levels, thereby facilitating more informed trading decisions.

DETAILED DESCRIPTION:

My detailed description of the indicator and use cases which I find very valuable.


What is the meaning of price spread?

In finance, a spread refers to the difference between two prices, rates, or yields. One of the most common types is the bid-ask spread, which refers to the gap between the bid (from buyers) and the ask (from sellers) prices of a security or asset.

We are going to use Open-Close spread.


What is Volume spread analysis?

Volume spread analysis (VSA) is a method of technical analysis that compares the volume per candle, range spread, and closing price to determine price direction.

HSHVSA

What does this mean?

We need to have a positive Volume Price Spread and a positive Moving average of Volume price spread for a positive trend. OR via versa a negative Volume Price Spread and a negative Moving average of Volume price spread for a negative trend.

What if we have a positive Volume Price Spread and a negative Moving average of Volume Price Spread?
It results in a neutral, not trending price action.

Thus the Indicator/Strategy returns 0 and Closes all long and short positions.

In the next Image you can see that trend is negative on 4h, we just move Negative on 12h and Positive on 1D. That means trend/Strategy flipped negative.

I am sorry, the chart is a bit messy. The idea is to use the indicator/strategy over more than 1 Timeframe.

https://algoalert.net/pdfs/fourier.pdf
https://algoalert.net/pdfs/IEEEwavelet.pdf


**Intelligent TA**
The intelligent accumulator is a proof of concept strategy. A hybrid between a recurring buy and TA-based entries and exits.

Distribute the amount of equity and add to your position as long as the TA condition is valid.

Use the exit TA condition to define your exit strategy.

Decide between adding only into losing positions to average down or take a riskier approach by allowing to add into a winning position as well.

Take full profit or distribute your exit into multiple take profit exists of the same size.

You can also decide if you allow your exit conditions to close your position in a loss or require a minimum take profit %.

The strategy includes a default built-in TA conditions just for showcasing the idea but the final intent of this script is to delegate the TA entries and exists to external sources.

The internal conditions use RSI length 7 crossing below the BB with std 1 for entries and above for exits.

To control the number of orders use the properties from settings:
- adjust the pyramiding
- adjust the percentage of equity
- make sure that pyramiding * % equity equals 100 to prevent over use of equity (unless using leverage)

The script is designed as an alternative to daily or weekly recurring buys but depending on the accuracy of your TA conditions it might prove profitable also in lower timeframes.

The reason the script is named Intelligent is because recurring buy is most commonly used without any decision making: buy no matter what with certain frequency. This strategy seeks to still perform recurring buys but filtering out some of the potential bad entries that can delay unnecessarily seeing the position in profits. The second reason is also securing an exit strategy from the beginning which no recurring buy option offers out-of-the-box.

**TrippleMACD**
Introduction:
Welcome to our cutting-edge cryptocurrency scalping strategy tailored specifically for the 1-minute timeframe. By combining three MACD indicators with different parameters and averaging them, along with applying RSI, we've developed a highly effective strategy for maximizing profits in the cryptocurrency market. This strategy is designed for automated trading through our bot, which executes trades using hooks. All trades are calculated for long positions only, ensuring optimal performance in a fast-paced market.

Key Components:

MACD (Moving Average Convergence Divergence):

We've utilized three MACD indicators with varying parameters to capture different aspects of market momentum.
Averaging these MACD indicators helps smooth out noise and provides a more reliable signal for trading decisions.
RSI (Relative Strength Index):

RSI serves as a complementary indicator, providing insights into the strength of bullish trends.
By incorporating RSI, we enhance the accuracy of our entry and exit points, ensuring timely execution of trades.
Strategy Overview:

Long Position Entries:

Initiate long positions when all three MACD indicators signal bullish momentum and the RSI confirms bullish strength.
This combination of indicators increases the probability of successful trades, allowing us to capitalize on uptrends effectively.
Utilizing Linear Regression:

Linear regression is employed to identify consolidation phases in the market.
Recognizing consolidation periods helps us avoid trading during choppy price action, ensuring optimal performance.
Suitability for Grid Trading Bots:

Our strategy is well-suited for grid trading bots due to frequent price fluctuations and opportunities for grid activation.
The strategy's design accounts for price breakthroughs, which are advantageous for grid trading strategies.
Benefits of the Strategy:

Consistent Performance Across Cryptocurrencies:

Through rigorous testing on various cryptocurrency futures contracts, our strategy has demonstrated favorable results across different coins.
Its adaptability makes it a versatile tool for traders seeking consistent profits in the cryptocurrency market.
Integration of Advanced Techniques:

By integrating multiple indicators and employing linear regression, our strategy leverages advanced techniques to enhance trading performance.
This strategic approach ensures a comprehensive analysis of market conditions, leading to well-informed trading decisions.
Conclusion:
Our cryptocurrency scalping strategy offers a sophisticated yet user-friendly approach to trading in the fast-paced environment of the 1-minute timeframe. With its emphasis on automation, accuracy, and adaptability, our strategy empowers traders to navigate the complexities of the cryptocurrency market with confidence. Whether you're a seasoned trader or a novice investor, our strategy provides a reliable framework for achieving consistent profits and maximizing returns on your investment.

**EMA RSI**
The Bybit EMA RSI Strategy is a powerful tool designed to help traders navigate the dynamic cryptocurrency markets on the Bybit exchange. This strategy combines the strength of Exponential Moving Averages (EMA) and the Relative Strength Index (RSI) to generate accurate trading signals.

The strategy utilizes two EMAs, a fast EMA and a slow EMA, to identify trends and potential entry points. When the fast EMA crosses above the slow EMA, it indicates a bullish trend and triggers a long signal. Conversely, when the fast EMA crosses below the slow EMA, it suggests a bearish trend and generates a short signal.

To confirm the validity of the signals, the strategy incorporates the RSI, a momentum oscillator that measures the speed and change of price movements. When the RSI falls below a specified lower threshold, it confirms a long signal, while an RSI above a specified upper threshold confirms a short signal.

The Bybit EMA RSI Strategy also takes into account the trader's account level on Bybit, adjusting the commission percentage accordingly. This ensures that the strategy adapts to the specific trading conditions of each user based on its Bybit level account.

Furthermore, the strategy includes built-in risk management features, allowing traders to set take profit and stop loss levels based on their risk tolerance. The entry prices are plotted on the chart, providing visual confirmation of the signals.

With its combination of trend-following and momentum indicators, the Bybit EMA RSI Strategy offers a comprehensive approach to trading on the Bybit exchange. Whether you're a seasoned trader or new to the markets, this strategy can help you make informed decisions and potentially maximize your trading outcomes.

**DCA STRAT**
Introducing the DCA Strategy, a powerful tool for identifying long entry and exit opportunities in uptrending assets like cryptocurrencies, stocks, and gold. This strategy leverages the Heikin Ashi candlestick pattern and the RSI indicator to navigate potential price swings.

Core Functionality:

Buy Signal: A buy signal is generated when a bullish (green) Heikin Ashi candle appears after a bearish (red) one, indicating a potential reversal in a downtrend. Additionally, the RSI must be below a user-defined threshold (default: 85) to prevent buying overbought assets.

Sell Signal: The strategy exits the trade when the RSI surpasses the user-defined exit level (default: 85), suggesting the asset might be overbought.

Backtesting Flexibility: Users can customize the backtesting period by specifying the start and end years.

Key Advantages:

Trend-Following: Designed specifically for uptrending assets, aiming to capture profitable price movements.
Dynamic RSI Integration: The RSI indicator helps refine entry signals by avoiding overbought situations.
User-Defined Parameters: Allows customization of exit thresholds and backtesting periods to suit individual trading preferences.
Commission and Slippage: The script factors in realistic commission fees (0.1%) and slippage (2%) for a more accurate backtesting experience.
Beats Buy-and-Hold: Backtesting suggests this strategy outperforms a simple buy-and-hold approach in uptrending markets.

Overall, the DCA Strategy offers a valuable approach for traders seeking to capitalize on long opportunities in trending markets with the help of Heikin Ashi candles and RSI confirmation.


**Bitcoin momentum**
This is a very simple long-only strategy I've used since December 2022 to manage my Bitcoin position.

I'm sharing it as an open-source script for other traders to learn from the code and adapt it to their liking if they find the system concept interesting.

General Overview
Always do your own research and backtesting - this script is not intended to be traded blindly (no script should be) and I've done limited testing on other markets beyond Ethereum and BTC, it's just a template to tweak and play with and make into one's own.

The results shown in the strategy tester are from Bitcoin's inception so as to get a large sample size of trades, and potential returns have diminished significantly as BTC has grown to become a mega cap asset, but the script includes a date filter for backtesting and it has still performed solidly in recent years (speaking from personal experience using it myself - DYOR with the date filter).

The main advantage of this system in my opinion is in limiting the max drawdown significantly versus buy & hodl. Theoretically much better returns can be made by just holding, but that's also a good way to lose 70%+ of your capital in the inevitable bear markets (also speaking from experience).

In saying all of that, the future is fundamentally unknowable and past results in no way guarantee future performance.

System Concept:
Capture as much Bitcoin upside volatility as possible while side-stepping downside volatility as quickly as possible.

The system uses a simple but clever momentum-style trailing stop technique I learned from one of my trading mentors who uses this approach on momentum/trend-following stock market systems.

Basically, the system "ratchets" up the stop-loss to be much tighter during high bearish volatility to protect open profits from downside moves, but loosens the stop loss during sustained bullish momentum to let the position ride.

It is invested most of the time, unless BTC is trading below its 20-week EMA in which case it stays in cash/USDT to avoid holding through bear markets. It only trades one position (no pyramiding) and does not trade short, but can easily be tweaked to do whatever you like if you know what you're doing in Pine.

Default parameters:
HTF: Weekly Chart
EMA: 20-Period
ATR: 5-period
Bar Lookback: 7

Entry Rule #1:
Bitcoin's current price must be trading above its higher-timeframe EMA (Weekly 20 EMA).

Entry Rule #2:
Bitcoin must not be in 'caution' condition (no large bearish volatility swings recently).
Enter at next bar's open if conditions are met and we are not already involved in a trade.

"Caution" Condition:
Defined as true if BTC's recent 7-bar swing high minus current bar's low is > 1.5x ATR, or Daily close < Daily 20-EMA.

Trailing Stop:
Stop is trailed 1 ATR from recent swing high, or 20% of ATR if in caution condition (ie. 0.2 ATR).
Exit on next bar open upon a close below stop loss.

I typically use a limit order to open & exit trades as close to the open price as possible to reduce slippage, but the strategy script uses market orders.

I've never had any issues getting filled on limit orders close to the market price with BTC on the Daily timeframe, but if the exchange has relatively low slippage I've found market orders work fine too without much impact on the results particularly since BTC has consistently remained above $20k and highly liquid.

Cost of Trading:
The script uses no leverage and a default total round-trip commission of 0.3% which is what I pay on my exchange based on their tier structure, but this can vary widely from exchange to exchange and higher commission fees will have a significantly negative impact on realized gains so make sure to always input the correct theoretical commission cost when backtesting any script.

Static slippage is difficult to estimate in the strategy tester given the wide range of prices & liquidity BTC has experienced over the years and it largely depends on position size, I set it to 150 points per buy or sell as BTC is currently very liquid on the exchange I trade and I use limit orders where possible to enter/exit positions as close as possible to the market's open price as it significantly limits my slippage.

But again, this can vary a lot from exchange to exchange (for better or worse) and if BTC volatility is high at the time of execution this can have a negative impact on slippage and therefore real performance, so make sure to adjust it according to your exchange's tendencies.

Tax considerations should also be made based on short-term trade frequency if crypto profits are treated as a CGT event in your region.

**Octopus nest strategy**
Hello Fellas,

Hereby, I come up with a popular strategy from YouTube called Octopus Nest Strategy. It is a no repaint, lower timeframe scalping strategy utilizing PSAR, EMA and TTM Squeeze.

The strategy considers these market factors:
PSAR -> Trend
EMA -> Trend
TTM Squeeze -> Momentum and Volatility by incorporating Bollinger Bands and Keltner Channels

Note: As you can see there is a potential improvement by incorporating volume.

What's Different Compared To The Original Strategy?
I added an option which allows users to use the Adaptive PSAR of @loxx, which will hopefully improve results sometimes.

Signals
Enter Long -> source above EMA 100, source crosses above PSAR and TTM Squeeze crosses above 0
Enter Short -> source below EMA 100, source crosses below PSAR and TTM Squeeze crosses below 0

Exit Long and Exit Short are triggered from the risk management. Thus, it will just exit on SL or TP.

Risk Management
"High Low Stop Loss" and "Automatic High Low Take Profit" are used here.

High Low Stop Loss: Utilizes the last high for short and the last low for long to calculate the stop loss level. The last high or low gets multiplied by the user-defined multiplicator and if no recent high or low was found it uses the backup multiplier.

Automatic High Low Take Profit: Utilizes the current stop loss level of "High Low Stop Loss" and gets calculated by the user-defined risk ratio.

Now, follows the bunch of knowledge for the more inexperienced readers.

PSAR: Parabolic Stop And Reverse; Developed by J. Welles Wilders and a classic trend reversal indicator.
The indicator works most effectively in trending markets where large price moves allow traders to capture significant gains. When a security’s price is range-bound, the indicator will constantly be reversing, resulting in multiple low-profit or losing trades.

TTM Squeeze: TTM Squeeze is a volatility and momentum indicator introduced by John Carter of Trade the Markets (now Simpler Trading), which capitalizes on the tendency for price to break out strongly after consolidating in a tight trading range.

The volatility component of the TTM Squeeze indicator measures price compression using Bollinger Bands and Keltner Channels. If the Bollinger Bands are completely enclosed within the Keltner Channels, that indicates a period of very low volatility. This state is known as the squeeze. When the Bollinger Bands expand and move back outside of the Keltner Channel, the squeeze is said to have “fired”: volatility increases and prices are likely to break out of that tight trading range in one direction or the other. The on/off state of the squeeze is shown with small dots on the zero line of the indicator: red dots indicate the squeeze is on, and green dots indicate the squeeze is off.

EMA: Exponential Moving Average; Like a simple moving average, but with exponential weighting of the input data.

**Trend deviation**
Directional Movement Index (DMI)
Bollinger Bands (BB)
Schaff Trend Cycle (STC)
Moving Average Convergence Divergence (MACD)
Momentum Indicator
Aroon Indicator
Supertrend Indicator
Relative Strength Index (RSI)
Exponential Moving Average (EMA)
Volume Weighted Average Price (VWAP)

backtest range and rules:

You can specify the start date for backtesting purposes.

You can can select the desired trade direction: Long, Short, or Both.

Entry and Exit Conditions:

LONG:
DMI Cross Up: The Directional Movement Index (DMI) indicates a bullish trend when the positive directional movement (+DI) crosses above the negative directional movement (-DI).
Bollinger Bands (BB): The price is below the upper Bollinger Band, indicating a potential reversal from the upper band.
Momentum Indicator: Momentum is positive, suggesting increasing buying pressure.
MACD (Moving Average Convergence Divergence): The MACD line is above the signal line, indicating bullish momentum.
Supertrend Indicator: The Supertrend indicator signals an uptrend.
Schaff Trend Cycle (STC): The STC indicates a bullish trend.
Aroon Indicator: The Aroon indicator signals a bullish trend or crossover.

When all these conditions are met simultaneously, the strategy considers it a favorable opportunity to enter a long trade.

SHORT:
DMI Cross Down: The Directional Movement Index (DMI) indicates a bearish trend when the negative directional movement (-DI) crosses above the positive directional movement (+DI).
Bollinger Bands (BB): The price is above the lower Bollinger Band, suggesting a potential reversal from the lower band.
Momentum Indicator: Momentum is negative, indicating increasing selling pressure.
MACD (Moving Average Convergence Divergence): The MACD line is below the signal line, signaling bearish momentum.
Supertrend Indicator: The Supertrend indicator signals a downtrend.
Schaff Trend Cycle (STC): The STC indicates a bearish trend.
Aroon Indicator: The Aroon indicator signals a bearish trend or crossover.

When all these conditions align, the strategy considers it an opportune moment to enter a short trade.

**HURST Future lines of demarcation**
J. M. Hurst introduced a concept in technical analysis known as the Future Line of Demarcation (FLD), which serves as a forward-looking tool by incorporating a simple yet profound line into future projections on a financial chart. Specifically, the FLD is constructed by offsetting the price half a cycle ahead into the future on the time axis, relative to the Hurst Cycle of interest. For instance, in the context of a 40 Day Cycle, the FLD would be represented by shifting the current price data 20 days forward on the chart, offering an idea of future price movement anticipations.

The utility of FLDs extends into three critical areas of insight, which form the backbone of the FLD Trading Strategy:
A price crossing the FLD signifies the confirmation of either a peak or trough formation, indicating pivotal moments in price action.
Such crossings also help determine precise price targets for the upcoming peak or trough, aligned with the cycle of examination.
Additionally, the occurrence of a peak in the FLD itself signals a probable zone where the price might experience a trough, helping to anticipate of future price movements.
These insights by Hurst in his "Cycles Trading Course" during the 1970s, are instrumental for traders aiming to determine entry and exit points, and to forecast potential price movements within the market.

To use the FLD Trading Strategy, for example when focusing on the 40 Day Cycle, a trader should primarily concentrate on the interplay between three Hurst Cycles:
The 20 Day FLD (Signal) - Half the length of the Trade Cycle
The 40 Day FLD (Trade) - The Cycle you want to trade
The 80 Day FLD (Trend) - Twice the length of the Trade Cycle

Traders can gauge trend or consolidation by watching for two critical patterns:
Cascading patterns, characterized by several FLDs running parallel with a consistent separation, typically emerge during pronounced market trends, indicating strong directional momentum.
Consolidation patterns, on the other hand, occur when multiple FLDs intersect and navigate within the same price bandwidth, often reversing direction to traverse this range multiple times. This tangled scenario results in the formation of Pause Zones, areas where price momentum is likely to temporarily stall or where the emergence of a significant trend might be delayed.

This simple FLD indicator provides 3 FLDs with optional source input and smoothing, A-through-H FLD interaction background, adjustable “Close the Trade” triggers, and a simple strategy for backtesting it all.

The A-through-H FLD interactions are a framework designed to classify the different types of price movements as they intersect with or diverge from the Future Line of Demarcation (FLD). Each interaction (designated A through H by color) represents a specific phase or characteristic within the cycle, and understanding these can help traders anticipate future price movements and make informed decisions.

The adjustable “Close the Trade” triggers are for setting the crossover/under that determines the trade exits. The options include: Price, Signal FLD, Trade FLD, or Trend FLD. For example, a trader may want to exit trades only when price finally crosses the Trade FLD line.

**YEONG RPG**
he code outlines a trading strategy that leverages Relative Strength (RS) and Rate of Change (RoC) to make trading decisions. Here's a detailed breakdown of the tactic described by the code:

Ticker and Period Selection: The strategy begins by selecting a stock ticker symbol and defining a period (len) for the calculations, which defaults to 14 but can be adjusted by the user.

Stock and Index Data Retrieval: It fetches the closing price (stock_close) of the chosen stock and calculates its 25-period exponential moving average (stock_ema). Additionally, it retrieves the closing price of the S&P 500 Index (index_close), used as a benchmark for calculating Relative Strength.

Relative Strength Calculation: The Relative Strength (rs) is computed by dividing the stock's closing price by the index's closing price, then multiplying by 100 to scale the result. This metric is used to assess the stock's performance relative to the broader market.

Moving RS Ratio and Rate of Change: The strategy calculates a Simple Moving Average (sma) of the RS over the specified period to get the RS Ratio (rs_ratio). It then computes the Rate of Change (roc) of this RS Ratio over the same period to get the RM Ratio (rm_ratio).

Normalization: The RS Ratio and RM Ratio are normalized using a formula that adjusts their values based on the mean and standard deviation of their respective series over the specified window. This normalization process helps in standardizing the indicators, making them easier to interpret and compare.

Indicator Plotting: The normalized RS Ratio (jdk_rs_ratio) and RM Ratio (jdk_rm_ratio) are plotted on the chart with different colors for visual analysis. A horizontal line (hline) at 100 serves as a reference point, indicating a neutral level for the indicators.

State Color Logic: The script includes a logic to determine the state color (statecolor) based on the previous state color and the current values of jdk_rs_ratio and jdk_rm_ratio. This color coding is intended to visually represent different market states: green for bullish, red for bearish, yellow for hold, and blue for watch conditions.

Signal Generation: The strategy generates buy, sell, hold, and watch signals based on the state color and the indicators' values relative to 100. For example, a buy signal is generated when both jdk_rs_ratio and jdk_rm_ratio are above 100, and the background color is set to green to reflect this bullish condition.

Trade Execution: Finally, the strategy executes trades based on the generated signals. A "BUY" trade is entered when a buy signal is present, and it is closed when a sell signal occurs.

Overall, the strategy uses a combination of RS and RoC indicators, normalized for better comparison, to identify potential buy and sell opportunities based on the stock's performance relative to the market and its momentum.

**Bollinger and Stochastic**
This trading strategy combines Bollinger Bands and the Stochastic indicator to identify entry opportunities in oversold and overbought conditions in the market. The aim is to capitalize on price rebounds from the extremes defined by the Bollinger Bands, with the confirmation of the Stochastic to maximize the probability of success of the operations.

Indicators Used
- Bollinger Bands Used to measure volatility and define oversold and overbought levels. When the price touches or breaks through the lower band, it indicates a possible oversold condition. Similarly, when it touches or breaks through the upper band, it indicates a possible overbought condition.
- Stochastic: A momentum oscillator that compares the closing price of an asset with its price range over a certain period. Values below 20 indicate oversold, while values above 80 indicate overbought.

Strategy Logic
- Long Entry (Buy): A purchase operation is executed when the price closes below the lower Bollinger band (indicating oversold) and the Stochastic is also in the oversold zone.
- Short Entry (Sell): A sell operation is executed when the price closes above the upper Bollinger band (indicating overbought) and the Stochastic is in the overbought zone.

**Sentiment analysis**
what's the sentiment on an asset.

**Risk-on/Risk-off**
monitor investors risk tolerance wrt response on economic patterns.
low risk periods = higher risk investments and reverse.
monitor actions and statements by central banks.
macroeconomic data, corporate earnings and others.
estimate whether market risk sentiment is high or low

**inverse volatility**
this is about hedging against portfolio risk, by gaining exposure to volatility.
An inverse volatility ETF bets on market stability. 
Use CBOE volatility index(VIX).
When an ETFS benchmark volatility rises, it loses value. Using this to monitor an ETFs volatility.
Using an ETF's volatility on VIX can help automate buy and sell orders to limit losses and maximize gains.

**Black Swan Catchers**
whenever an unpredictable event happens. Such as the financial crisis and covid.
Leverage the intense market volatility following such an event. It's to hook yourself up to options/futures and very speculative markets when such events occur.


**Arbitrage**
Not possible at the moment





















































