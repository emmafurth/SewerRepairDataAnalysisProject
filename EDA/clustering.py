import pandas as pd
import geopandas 
import folium
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

df = geopandas.read_file("sewer_repair.")
