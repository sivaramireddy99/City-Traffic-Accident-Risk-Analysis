###############   Auto EDA --------------------------------------------------------------

import pandas as pd

df = pd.read_csv(r"C:\Users\badam\Downloads\cleaned_CTARA_dataset.csv")

##### Sweetviz............................
###  pip install sweetviz
import sweetviz as sv 

s = sv.analyze(df)

s.show_html()

##### D-Tale...............................


# pip install dtale # please install werkzeug appropriate version (pip install werkzeug==2.0.3)
import dtale
import pandas as pd

df = pd.read_csv(r"C:\Users\badam\Downloads\cleaned_CTARA_dataset.csv")

d = dtale.show(df, host = 'localhost', port = 8000)

d.open_browser()


#### Pandas Profiling,...........................

# pip install --upgrade ydata-profiling
import pandas as pd
from ydata_profiling import ProfileReport
import os

profile = ProfileReport(df, title = "CTARA", explorative = True)
output_file = "CTARA.html"
profile.to_file(output_file)

print(f"✅ Report saved at: {os.path.abspath(output_file)}")


