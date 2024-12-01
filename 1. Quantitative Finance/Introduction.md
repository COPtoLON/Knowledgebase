# There will be significant changes in the coming months

Over the coming months I will change the layout and structure of this repository.
At the moment, the repository has been structured after subject and resources.
But I will gradually change it to a walk-through of each significant topic.

I will be starting with quantitative finance, specifically walking through work
and examples on quantitative portfolio management, as this has recently become 
desired by others.

## If you want to contribute

If you've found yourself wanting to contribute either with some content or with
a donation. Please feel free to reach out to me on Email: mark@brezina.dk or [Mark Brezina - Linkedin](https://www.linkedin.com/in/markdbrezina/)


**Acknowledgment**\
Author: [Mark Brezina](https://github.com/CopenhagenToLondon)\
Contributors: [Aksel Fristrup](https://github.com/afristrup)


**Note to self, need own pictures**

1. [Trading](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/Introduction.md#trading)
2. [Portfolio management](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/Introduction.md#portfolio-management)
3. [Risk management](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/Introduction.md#risk-management)
4. [Pricing](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/Introduction.md#pricing)



# Trading

In quantitative finance trading, refers to the practice of buying or selling an asset, such as Stocks, Bonds, Options, Futures, Currency(crypto or otherwise) and more.

**Interday = Between days.**\
**Intraday = Inside one day.**\
**Bid = What price is being bid for a buy or sell order.**\
**Ask = What price is being asked for a buy or sell order.**\
**Bid-ask spread = The distance between the Bid and Ask on orders.**\
**Brokerage fee = The fee paid to a brokerage upon performing a trade.**\
**Signal = An indication in the market to buy or sell an asset.**\
**Long = Refers to buying. This also mean buying with borrowed money.**\
**Short = Refers to selling. This also means selling borrowed assets.**


## HFT - High frequency trading - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/HFT/Introduction.md) 
High frequency trading refers to trading done on the intraday time interval. Meaning within one day.
This is not to be confused with the practice of market making, which may implement High frequency trading.
But High frequency trading isn't exclusively market making.


* To perform high frequency trading successfully, one has to be subject to negligable Brokerage fees.
* To perform high frequency trading successfully, one has to be able to obtain live or intraday data at less than 2 hour intervals.
* To perform high frequency trading successfully, one has to be able to perform trading operations on intraday time intervals.

### Concepts
Here is a list of trading strategies for High frequency trading

**Market making** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/HFT/Market%20making.md) \
This strategy utilizes the distance in a bid-ask spread, along with the opportunity to obtain brokerage fee.
As the name indicates, this will be a strategy performed in running markets. 

**Arbitrage strategies** -  [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/HFT/Arbitrage.md) \
Arbitrage strategies, utilizes methods to determine incorrectly priced assets.
* Statistical arbitrage, utilizes statistics to determine arbitrage opportunities.
* Deterministic arbitrage, utilizes deterministic methods to determine arbitrage opportunities. - A simple example is the arbitrage opportunity between two exchanges with a time-delay between them.

**Momentum strategies** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/HFT/Momentum.md) \
Momentum strategies utilizes momentum in price changes for assets.\
With no or negligable brokerage fees, miniscule changes in the price of an asset can amount to large profits.


### Books, Notes, Websites
https://www.deutsche-boerse.com/resource/blob/69642/6bbb6205e6651101288c2a0bfc668c45/data/high-frequency-trading_en.pdf
https://www.quantifiedstrategies.com/trading-strategies/
https://tradinginvestment.weebly.com/blog/-dont-confuse-statistical-arbitrage-with-deterministic-arbitrage

### Code



## LFT - Low frequency trading - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/Introduction.md) 

Low frequency trading refers to trading done on the interday time interval. Meaning on intervals larger than a single day.
This is not to be confused with the practice of daytrading, which is Low frequency trading, but algorithmic trading also falls into this category. Mean reversion trading is a popular strategy implemented by both algorithmic low frequency trading and day traders.

* To perform low frequency trading successfully, one has to optimize trading returns against brokerage fees.
* To perform low frequency trading successfully, one has to be able to obtain the necessary data to run the selected strategy.
* To perform low frequency trading successfully, one has to be able to perform trading operations.

### Concepts

Here is a list of trading strategies for low frequency trading

**Mean reversion** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/1.%20Mean%20reversion.md) \
These strategies focus on the general market property of mean reversion.
![Mean Reversion](https://www.tradinformed.com/wp-content/uploads/2019/01/Mean-Reversion.jpg)



**Trend following** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/2.%20Trend%20following.md) \
These strategies focus on the occasions where markets or assets trend upwards or downwards.
![Trend trading](https://centerpointsecurities.com/wp-content/uploads/2021/07/Momentum-Trading.jpg)

**Pairs trading** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/3.%20Pairs%20Trading.md) \
These strategies focus on the occasions where two strongly correlated markets or assets diverge.
![Pairs trading](https://www.quantifiedstrategies.com/wp-content/uploads/2023/10/image-61.png)

**Momentum** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/4.%20Momentum.md) \
These strategies focus on the occasions where markets or assets gain momentum in an upwards or downwards direction.
![Momentum trading](https://centerpointsecurities.com/wp-content/uploads/2021/07/Momentum-Trading.jpg)

**Breakout** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/5.%20Breakout.md) \
These strategies focus on the occasions where assets breakout of a previous limit. Such as a previous market cap.

**Market-neutral** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/HFT/Market%20making.md) \
These strategies focus on ...

**Sentiment trading** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/6.%20Sentiment.md) \
These strategies focus on the occasions where the market sentiment changes- or affects the momentum of an asset.
![Sentiment trading](https://vladimirribakov.com/wp-content/uploads/sentiment-trading.jpg)

**Events** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/7.%20Events.md) \
These strategies focus on the occasions where unique events changes the price- or affects the momentum of an asset.

**Mathematical patterns** - [link](https://github.com/CopenhagenToLondon/Knowledgebase/blob/main/1.%20Quantitative%20Finance/LFT/8.%20Mathematical%20patterns.md) \
These strategies focus on mathematical patterns to detect buy or sell opportunities.


### Books, Notes, Websites

### Code





# Portfolio Management

### Concepts

### Books, Notes, Websites

### Code

# Risk Management

### Concepts

### Books, Notes, Websites

### Code

# Pricing

### Concepts

### Books, Notes, Websites

### Code





Mathematical model

The bid-ask conundrum
Given any asset, financial or otherwise. 
The bidder holds the objective of buying the asset at the lowest price.
The asker holds the objective of selling the asset at the highest price.
But!
Given a financial market, another complexity is added to this feature.
A bidder may also hold the objective of buying the asset at the lowest price, trending upwards.
While the asker may also hold the objective of selling the asset at the highest price, trending downwards.
Both are looking to minimize risk towards a proposed future event. An up-trending market and a down trending market.
The supply-demand conundrum

The path of least resistance vs the path of least time problem for financial markets
Given a market with k participants.
Each market participant decides at time t = 0, whether to follow a path of least resistance or a path of least time.
After each choice has been made, a success-score will be given to each participant.
	For participants following the path of least resistance, returns will follow a normal distribution, with mean 0 and standard deviation σ_polr
	For participants following the path of least time, returns will follow a normal distribution with mean μ_polt>0 and standard deviation σ_polt>σ_polr.
The market winners will be the participants m_i through to m_n, whose returns are above market mean after costs.
In this framework risk, probabilities and time horizons have been considered.
Conjecture A – market states
Given a market M, let S denote the state of the market M. The number of unique states in S will have a relation R, which takes as input the number of market participants p and the time T, representing the time since the market was initiated.

It is in the mathematicians and in the market participants interest that the market states remain within Q. But this is seldom the case.

Furthermore, it becomes our endeavour as market participants to correctly determine the Markov transition matrix between a select discretionized series of states, with precise and accurate p-values.
Problem B – market dynamics
The market dynamics(rules) can be determined as finitely many algorithmic steps.
But the market system is chaotic and unbounded. Participants, events and factors are added or removed over time.
Hypothesis on the direction reversal effect
Given any market state, reversals of the direction of returns will occur.
The likelihood of a reversal occurring increases as the asset price approaches a “limit”. 
In flat market states, the likelihood of a reversal occurring is significantly higher than in any other market. In approaching an all-time high or an annual high the likelihood increases.
The extremal event reversal hypothesis
Given any market state and the occurrence of an extremal event.
The likelihood of a reversal occurring increases from above 75% to 97% in step with the size of the extremal outcome and the number of continuous days following the same direction of return as the extremal outcome.
Hypothesis on the occurrence of spontaneous changes in the direction of returns
Given any market state, spontaneous changes may occur in the direction of returns. 
The reasons for such can vary and even though some reasons are more systematic, changes may occur for the simplest and most irrational of reasons. 
The time horizon of changes taking effect may also vary from minutes to months.
Buffett’s theorem on the intrinsic invariant value of a financial asset
Given an asset and a market state. 
An intrinsic invariant value can be obtained for the asset, given the current market state.
The corresponding value movements will either be approaching- or move in a mean reversion process around the intrinsic invariant value. 
The Signal Theorem.
Given any financial asset, market and time horizon. 
A signal is a proposed repeated pattern occurring given certain conditions, the effect of which is either a certain price movement or adjustment of significant variable.
Signals have varying levels of certainty.
Mathematical signals and fundamental signals can be combined and build into trading strategies.

Problem C – market impact
A participant in the market, affects the market. Leading to a self-intersection problem. Whereby a participant’s actions affect the participant’s actions.
The market impact hypothesis
Given a market participant m, if the market volume of m exceeds x% of the market volume within the time horizon [y:z]. Then m runs a risk of affecting the asset price adversely.
To minimize the market impact, m can employ a trailing order.

Problem D – market P-distributions
The probability distributions associated with most variables in the market are most commonly not normal distributions. The likelihood of probability distributions being fat-tailed, is significantly higher than expected. The likelihood of distributions being uneven or “chunky” is significantly higher than expected.
Problem E – market return sizes
The size of returns is directly correlated with a relationship between the novelty, supply and desirability of the market. 

Hypothesis A – the “VS” idea
A market is to be considered a competition between buyers and between sellers separately and across. Rewards can be reaped by competing against the specific participants, but also by competing against the entire market.
Hypothesis on the behaviour of down-trending markets
Given a down-trending market.
It will be unprofitable to run a long position.
But it will be profitable to run a short position.
Hypothesis on the behaviour of flat-trending markets
Given a flat-trending market.
it will be profitable to run long positions on upwards slopes.
For which a sale should occur at a profitable point after a change in direction.
But it will also be profitable to run a short position on downwards slopes.
For which a close of position should occur at a profitable point after a change in direction.
Hypothesis on the behaviour of up-trending markets
Given an up-trending market.
It will be profitable to run a long position.
But it will be unprofitable to run a short position.
The market participant hypothesis
Given a market with k participants.
The market winner, will be the participant m, whose return is the market maximum after costs.
In this framework, neither risk, probabilities nor time horizons are considered.
The Second market participant hypothesis
Given a market with k participants.
The market winners, will be the participants m_i through to m_n, whose returns are above market mean after costs.
In this framework, neither risk, probabilities nor time horizons are considered.
The minimal information geometry hypothesis
Given n market participants.
If no trades have occurred from time t = 0 to time t = T. The first trade occurring by participant m, at time t = T+1. Spreads information of m’s supply-demand relationship on the chosen asset.
This information can be used by competitors to gauge possible parasitic trades on m.
The absolute information geometry hypothesis
Given n market participants.
The trades occurring by participant m, at time t = T. Spreads information of m’s supply-demand relationship on a chosen asset. This information can be used by competitors to gauge possible parasitic trades on m’s position.
	If participant m, buys stock A at time T, then participant m* can buy Stock A at time T+1.
	If participant m, holding Stock A, sells A at time T2, then participant m* can sell stock A at time T2.




Profit strategy
	Find the market state
	Down
	Up
	No/Flat
	Unknown.

	Find volatility state
	High
	Medium
	Low
	Depending on market state, employ strategy.
But what if it goes the opposite direction or changes market state?
Small changes in trend are acceptable with regards to losses. We need to provide margin for the calls in small changes. Large changes ought to trigger a sell or close.
If down-trend – Short
Run a short between local max and min. – to minimize risk of loss.
Detect using 0-tangents.
If up-trend – Long
Run a long between local min and max. – to minimize risk of loss.
Detect using 0-tangents.
If no/flat trend - Mean reversion
Run a long:  If local min going towards max.
Run a Short:  If local max going towards min.
Detect local min, local max.

Find 0-tangents using positive vs negative count? Mean return?
-1,0,1 and 1,0, -1?
	α-quantile?
	Bollinger band?
	value + x%?

Find 0-tangents using positive vs negative count? Mean Return?
-1,0,1 and 1,0, -1?
	α-quantile?
	Bollinger band?
	value + x%?


Use the moving averages in mean reversion times.
When 6d MA crosses down through 20d MA, then you have passed local max.
When 20d MA crosses down through 6d MA, then you have passed local min.

But what if it goes the opposite direction or changes market state?

If unknown. Detect the last state and use the same as an assumption.

Determine the most likely future state of the market in 1 – 3 days from now.
Use it to correct the current strategy.
	

Major support and resistance.
Accumulation zones – køb med forventet stigning - større volume.
Distribution zones – salg med forventet fald – større volume


Sentiment analysis med ChatGPT
Market impact
Sentiment

Kør process for hver artikel på hver news bureau.

Vi kører hver dag, news sentiment analysis med ChatGPT 4.
Vi tjekker market impact og sentiment for hver artikel på nyhedsbureauerne.
