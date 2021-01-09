import numpy as np
import pandas as pd


countrylanguage = np.genfromtxt('languages.csv',delimiter='|',dtype=str)

countries = {}
for country,language in countrylanguage:
    if country not in countries:
        countries[country] = [language]
    elif language not in countries[country]:
        countries[country] += [language]

output = []
for country,languages in countries.items():
    row = [country]
    for i in range(3):
        try:
            row+=[languages[i][:-1]]
        except:
            row+=['']
    output+=[row]

print(np.asarray(output))
np.savetxt("../tables/languages2.csv",np.asarray(output).astype('S18'),delimiter="|",fmt='%s')