# Introduction
A UK-based online store called London Gift Shop (LGS) sells gift-ware and most of the company's customers are wholesales. This company has been operating online for about 10 years. The owner's concern is that their business has not grown much in recent years. In this regard, the LGS marketing team is looking for solutions that help economic prosperity by using new technologies and better understanding of customer needs. The Jarvis consulting data engineering team went to their aid for delivering a proof of concept (PoC) project. It helps the LGS marketing by analyzing customer shopping behaviour. We used the transaction dataset in a csv file from 01/12/2009 to 09/12/2011. The provided data is stored in a PostgreSQL database which is provisioned using a docker container, and then it is connected to the Jupyter Notebook to answer all the business questions. We created plots to visualize the answers.
# Online Store Cloud Architecture
The LGS IT team provides a high-level system design diagram below. Since it's a PoC project, we are not allowed to work in the LGS Azure environment. As per request, the LGS IT team dumped the transaction data between 01/12/2009 and 09/12/2011 into a SQL file, which is shared with the Jarvis team.
![Cloud](https://user-images.githubusercontent.com/71785631/152241514-c4d1b56d-c86b-45eb-9046-a9bd9fd6cc76.png)
# Data Analytics and Wrangling
The data analysis code is available [here] (https://github.com/jarviscanada/jarvis_data_eng_NazaninAkbari/blob/master/python_data_analytics/retail_data_analytics_wrangling.ipynb).
In this project, we want to find business solution to increase the revenue of the company. To do so, the data analysis is done as the following steps.
- The distribution for the first 85 quantiles are plotted to find the outliers.
![graph1](https://user-images.githubusercontent.com/71785631/152553547-35db666f-de32-4ba0-8fe5-730ba0e7bf4a.png)
- Monthly placed and cancelled orders are plotted to find the sign of a trend and downward trend. In November 2010 and 2011 we can see the highest rate of the placed order. This trend is also predictable for the following years. The highest rate of cancelled orders has occurred in the two last months of the year.
![graph2](https://user-images.githubusercontent.com/71785631/152555655-acc26c62-837e-4857-a462-d7fd10c8323d.png)
- Plot the monthly sales graph to visualize the rate of growth. 



# Deployment
Jupyter notebook environment is running using docker. Analytic rsult eventually deliver to LGS via Jupyter Notebook and Github. 
