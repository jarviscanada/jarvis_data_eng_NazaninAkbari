# Introduction
A UK-based online store called London Gift Shop (LGS) sells gift-ware and most of the company's customers are wholesales. This company has been operating online for about 10 years. The owner's concern is that their business has not grown much in recent years. In this regard, the LGS marketing team is looking for solutions that help economic prosperity by using new technologies and better understanding of customer needs. The Jarvis consulting data engineering team went to their aid for delivering a proof of concept (PoC) project. It helps the LGS marketing by analyzing customer shopping behaviour. We used the transaction dataset in a csv file from 01/12/2009 to 09/12/2011. The provided data is stored in a PostgreSQL database which is provisioned using a docker container, and then it is connected to the Jupyter Notebook to answer all the business questions. We created plots to visualize the answers.
# Online Store Cloud Architecture
The LGS IT team provides a high-level system design diagram below. Since it's a PoC project, we are not allowed to work in the LGS Azure environment. As per request, the LGS IT team dumped the transaction data between 01/12/2009 and 09/12/2011 into a SQL file, which is shared with the Jarvis team.
![Cloud](https://user-images.githubusercontent.com/71785631/152241514-c4d1b56d-c86b-45eb-9046-a9bd9fd6cc76.png)
# Data Analytics and Wrangling
The data analysis code is available [here](https://github.com/jarviscanada/jarvis_data_eng_NazaninAkbari/blob/master/python_data_analytics/retail_data_analytics_wrangling.ipynb).
In this project, we want to find business solution to increase the revenue of the company.
- To increase the financial growth, the LGS team should assess the habits of new customers. Give them promotions and discounts of popular items to make them loyal. Moreover, the LGS can provide the customers long-term return policy for confident purchase.
- By analyzing monthly growth, the company can apply new marketing strategy to increase the revenue for the month that there is downward growth.

# Deployment
Jupyter notebook environment is running using docker. Analytic rsult eventually deliver to LGS via Jupyter Notebook and Github. 

# Improvement
- Using more recent data and greater sample size would be recommended.
- Adding more features to the sataset
- Assessing the items that are being placed and cancelled
