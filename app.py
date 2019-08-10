import io
import random
from flask import Response
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure
import random
from io import StringIO
import yfinance as yf  
import pandas as pd
from flask import request
import json 
import matplotlib.pyplot as plt
from flask_cors import CORS,cross_origin
from flask import Flask, make_response
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

@app.route('/plot.png',methods=['POST'])
@cross_origin()
def plot_png():
    fig = create_figure()
    output = io.BytesIO()
    FigureCanvas(fig).print_png(output)
    return Response(output.getvalue(), mimetype='image/png')

def create_figure():
    if request.headers['Content-Type'] == 'application/json':
        d=json.dumps(request.json)
    d=json.loads(d)
    print(d)
    fig = Figure()
    plt = fig.add_subplot(1, 1, 1)
    data = yf.download(d['company'],'2019-01-01','2019-08-07')
    plt.plot(data.Close)
    return fig

if __name__ == '__main__':
    app.run(debug=True)