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





































