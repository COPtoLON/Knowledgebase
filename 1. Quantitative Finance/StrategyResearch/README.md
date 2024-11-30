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




























































