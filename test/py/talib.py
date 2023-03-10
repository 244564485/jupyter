TaLib官网：http://ta-lib.org/

Python wrapper for TA-Lib：http://mrjbq7.github.io/ta-lib/doc_index.html

一、TaLib简介
TaLib是一个Python金融指数处理库。包含了很多技术分析里的常用参数指标，例如MA、SMA、WMA、MACD、ATR等。

二、TaLib安装
注：TaLib是一个pyhon库，故在安装TaLib前需要安装Python。

1. pip安装
（官方安装教程文档：https://mrjbq7.github.io/ta-lib/install.html ）

在命令行下输入命令（在线安装）：
pip install Ta-Lib

（注意：使用pip安装可能会出现这个问题：
error: Microsoft Visual C++ 14.0 is required. Get it with "Microsoft Visual C++ Build Tools": https://visualstudio.microsoft.com/downloads/
此时就需要手动安装。这个问题在安装其他python第三方包时也可能出现，解决方法与此相同）
2. 手动安装
A. 找到并下载自己需要的对应版本的whl格式文件。
（如：若本机安装是32位的python3.6，则选TA_Lib‑0.4.17‑cp36‑cp36m‑win32.whl下载；
若本机安装的是64位的python2.7，则选择TA_Lib‑0.4.17‑cp27‑cp27m‑win_amd64.whl，其他同理）

下载地址在：
https://www.lfd.uci.edu/~gohlke/pythonlibs/

B. 在命令行中（命令行的打开方式在文章最后的Tips里），进入此whl文件所在的目录，执行命令：

pip install 下载的whl文件名
如：pip install TA_Lib-0.4.17-cp37-cp37m-win_amd64.whl

C. 或不进入所在目录，直接执行命令：

pip install 文件所在的绝对路径+文件名
如：pip install D:\my_packages\ TA_Lib-0.4.17-cp37-cp37m-win_amd64.whl

3. 检测安装成功
在包安装成功后，命令行界面会有“ Successfully installed TA-Lib ”的提示。

也可通过在命令行输入命令“ pip install ta-lib ”进行检测，如果出现“ Requirement already satisfied: ta-lib in …”（”…“为安装此文件的目录），即表示安装成功。

三、TaLib函数介绍
1. 几个指标及其用法演示
注意：talib函数的输入数据需要是Numpy的ndarray 类型，如果数据不是这个类型就需要提前进行类型转换。（“Every function takes the same input, passed as a dictionary of Numpy arrays”）。

在使用tqsdk时，K线及tick序列可以使用to_dataframe()函数将数据序列转化为pandas.DataFrame，即可直接取用其close字段作为talib函数的输入数据了（例如：df_klines=klines.to_dataframe()）。

SMA （简单移动平均线）（参数1：收盘价序列，参数2：时间周期（均线的计算长度 即 几日均线））
real = SMA(close, timeperiod=30)

例：双均线策略中使用SMA的实例：

https://github.com/shinnytech/tqsdk-python/blob/master/tqsdk/demo/doublema.py

ATR（平均真实波幅）
（参数1：最高价序列，参数2：最低价序列，参数3：收盘价序列，参数4：时间周期）
real = ATR(high, low, close, timeperiod=14)

例：海龟策略中使用ATR的实例：

https://github.com/shinnytech/tqsdk-python/blob/master/tqsdk/demo/turtle.py

MACD（异同移动平均线）
macd, macdsignal, macdhist = MACD(close, fastperiod=12, slowperiod=26, signalperiod=9)

BBANDS （布林带）
upperband, middleband, lowerband = BBANDS(close, timeperiod=5, nbdevup=2, nbdevdn=2, matype=0)

2. talib中所有指标函数
A. 按照首字母排序：
官方函数列表：http://ta-lib.org/function.html

B. 按照类型分组（点击超链接进入官方文档查看函数用法）：
Overlap Studies（重叠研究类）
Momentum Indicators（动量指标类）
Volume Indicators（成交量指标类）
Volatility Indicators（波动性指标类）
Price Transform（价格指标类）
Cycle Indicators（周期指标类）
Pattern Recognition（形态识别类）
Statistic Functions（统计函数类）
Math Transform（数学变换类）
Math Operators（数学运算符类）
C. 每组的指标函数：
（可在页面内按 Ctrl+f 键搜索到指标后，点击其所在组别的超链接查看函数的使用方法）

重叠研究
BBANDS — Bollinger Bands （布林带）
DEMA — Double Exponential Moving Average （双指数移动平均线）
EMA — Exponential Moving Average （指数移动平均）
HT_TRENDLINE — Hilbert Transform - Instantaneous Trendline
KAMA — Kaufman Adaptive Moving Average
MA — Moving average （移动平均线）
MAMA — MESA Adaptive Moving Average （自适应移动平均）
MAVP — Moving average with variable period （变周期移动平均）
MIDPOINT — MidPoint over period
MIDPRICE — Midpoint Price over period
SAR — Parabolic SAR
SAREXT — Parabolic SAR - Extended
SMA — Simple Moving Average （简单移动平均线）
T3 — Triple Exponential Moving Average (T3)
TEMA — Triple Exponential Moving Average （三重指数移动平均线）
TRIMA — Triangular Moving Average
WMA — Weighted Moving Average （加权移动平均线）
动量指标
ADX — Average Directional Movement Index （平均趋向指数）
ADXR — Average Directional Movement Index Rating
APO — Absolute Price Oscillator
AROON — Aroon
AROONOSC — Aroon Oscillator
BOP — Balance Of Power
CCI — Commodity Channel Index
CMO — Chande Momentum Oscillator
DX — Directional Movement Index
MACD — Moving Average Convergence/Divergence (平滑异同移动平均线)
MACDEXT — MACD with controllable MA type
MACDFIX — Moving Average Convergence/Divergence Fix 12/26
MFI — Money Flow Index
MINUS_DI — Minus Directional Indicator
MINUS_DM — Minus Directional Movement
MOM — Momentum
PLUS_DI — Plus Directional Indicator
PLUS_DM — Plus Directional Movement
PPO — Percentage Price Oscillator
ROC — Rate of change : ((price/prevPrice)-1)*100
ROCP — Rate of change Percentage: (price-prevPrice)/prevPrice
ROCR — Rate of change ratio: (price/prevPrice)
ROCR100 — Rate of change ratio 100 scale: (price/prevPrice)*100
RSI — Relative Strength Index （相对强弱指数）
STOCH — Stochastic
STOCHF — Stochastic Fast
STOCHRSI — Stochastic Relative Strength Index
TRIX — 1-day Rate-Of-Change (ROC) of a Triple Smooth EMA
ULTOSC — Ultimate Oscillator
WILLR — Williams' %R
成交量指标
AD — Chaikin A/D Line
ADOSC — Chaikin A/D Oscillator
OBV — On Balance Volume
波动率指标
ATR — Average True Range （平均真实波幅）
NATR — Normalized Average True Range
TRANGE — True Range （真实波幅）
价格指标
AVGPRICE — Average Price
MEDPRICE — Median Price
TYPPRICE — Typical Price
WCLPRICE — Weighted Close Price
周期指标
HT_DCPERIOD — Hilbert Transform - Dominant Cycle Period
HT_DCPHASE — Hilbert Transform - Dominant Cycle Phase
HT_PHASOR — Hilbert Transform - Phasor Components
HT_SINE — Hilbert Transform - SineWave
HT_TRENDMODE — Hilbert Transform - Trend vs Cycle Mode
形态识别
CDL2CROWS — Two Crows （两只乌鸦）
CDL3BLACKCROWS — Three Black Crows （三只乌鸦）
CDL3INSIDE — Three Inside Up/Down （三内部上涨和下跌）
CDL3LINESTRIKE — Three-Line Strike （三线打击）
CDL3OUTSIDE — Three Outside Up/Down （三外部上涨和下跌）
CDL3STARSINSOUTH — Three Stars In The South （南方三星）
CDL3WHITESOLDIERS — Three Advancing White Soldiers （三白兵）
CDLABANDONEDBABY — Abandoned Baby （弃婴形态）
CDLADVANCEBLOCK — Advance Block （前方受阻（大敌当前））
CDLBELTHOLD — Belt-hold （捉腰带线）
CDLBREAKAWAY — Breakaway （脱离）
CDLCLOSINGMARUBOZU — Closing Marubozu （收盘缺影线）
CDLCONCEALBABYSWALL — Concealing Baby Swallow （藏婴吞没）
CDLCOUNTERATTACK — Counterattack （反击线）
CDLDARKCLOUDCOVER — Dark Cloud Cover （乌云压顶）
CDLDOJI — Doji （十字）
CDLDOJISTAR — Doji Star （十字星）
CDLDRAGONFLYDOJI — Dragonfly Doji （蜻蜓十字/T形十字）
CDLENGULFING — Engulfing Pattern （吞噬模式）
CDLEVENINGDOJISTAR — Evening Doji Star （十字暮星）
CDLEVENINGSTAR — Evening Star （暮星）
CDLGAPSIDESIDEWHITE — Up/Down-gap side-by-side white lines （向上/下跳空并列阳线）
CDLGRAVESTONEDOJI — Gravestone Doji （墓碑十字/倒T十字）
CDLHAMMER — Hammer （锤头线）
CDLHANGINGMAN — Hanging Man （上吊线）
CDLHARAMI — Harami Pattern
CDLHARAMICROSS — Harami Cross Pattern
CDLHIGHWAVE — High-Wave Candle
CDLHIKKAKE — Hikkake Pattern （陷阱）
CDLHIKKAKEMOD — Modified Hikkake Pattern
CDLHOMINGPIGEON — Homing Pigeon （家鸽）
CDLIDENTICAL3CROWS — Identical Three Crows
CDLINNECK — In-Neck Pattern
CDLINVERTEDHAMMER — Inverted Hammer
CDLKICKING — Kicking （反冲形态）
CDLKICKINGBYLENGTH — Kicking - bull/bear determined by the longer marubozu
CDLLADDERBOTTOM — Ladder Bottom
CDLLONGLEGGEDDOJI — Long Legged Doji
CDLLONGLINE — Long Line Candle
CDLMARUBOZU — Marubozu
CDLMATCHINGLOW — Matching Low （相同低价）
CDLMATHOLD — Mat Hold
CDLMORNINGDOJISTAR — Morning Doji Star （十字晨星）
CDLMORNINGSTAR — Morning Star （晨星）
CDLONNECK — On-Neck Pattern
CDLPIERCING — Piercing Pattern （刺透形态）
CDLRICKSHAWMAN — Rickshaw Man
CDLRISEFALL3METHODS — Rising/Falling Three Methods
CDLSEPARATINGLINES — Separating Lines
CDLSHOOTINGSTAR — Shooting Star
CDLSHORTLINE — Short Line Candle
CDLSPINNINGTOP — Spinning Top（纺锤）
CDLSTALLEDPATTERN — Stalled Pattern
CDLSTICKSANDWICH — Stick Sandwich
CDLTAKURI — Takuri (Dragonfly Doji with very long lower shadow)
CDLTASUKIGAP — Tasuki Gap
CDLTHRUSTING — Thrusting Pattern
CDLTRISTAR — Tristar Pattern
CDLUNIQUE3RIVER — Unique 3 River
CDLUPSIDEGAP2CROWS — Upside Gap Two Crows
CDLXSIDEGAP3METHODS — Upside/Downside Gap Three Methods
统计函数
BETA — Beta （贝塔系数）
CORREL — Pearson's Correlation Coefficient (r)
LINEARREG — Linear Regression
LINEARREG_ANGLE — Linear Regression Angle
LINEARREG_INTERCEPT — Linear Regression Intercept
LINEARREG_SLOPE — Linear Regression Slope
STDDEV — Standard Deviation
TSF — Time Series Forecast
VAR — Variance
数学变换
ACOS — Vector Trigonometric ACos
ASIN — Vector Trigonometric ASin
ATAN — Vector Trigonometric ATan
CEIL — Vector Ceil
COS — Vector Trigonometric Cos
COSH — Vector Trigonometric Cosh
EXP — Vector Arithmetic Exp
FLOOR — Vector Floor
LN — Vector Log Natural
LOG10 — Vector Log10
SIN — Vector Trigonometric Sin
SINH — Vector Trigonometric Sinh
SQRT — Vector Square Root
TAN — Vector Trigonometric Tan
TANH — Vector Trigonometric Tanh
数学运算符
ADD — Vector Arithmetic Add
DIV — Vector Arithmetic Div
MAX — Highest value over a specified period
MAXINDEX — Index of highest value over a specified period
MIN — Lowest value over a specified period
MININDEX — Index of lowest value over a specified period
MINMAX — Lowest and highest values over a specified period
MINMAXINDEX — Indexes of lowest and highest values over a specified period
MULT — Vector Arithmetic Mult
SUB — Vector Arithmetic Substraction
SUM — Summation