import pandas as pd
import plotly.express as px

import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output


external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

df = pd.read_csv(
    'https://raw.githubusercontent.com/Zhongfu-Mao/zero-to-hero/master/DataScience/dataset/Plotly/Urban_Park_Ranger_Animal_Condition.csv')

app.layout = html.Div([

    html.Div([
        dcc.Graph(id='our_graph')
    ], className='nine columns'),

    html.Div([

        html.Br(),
        html.Div(id='output_data'),
        html.Br(),

        html.Label(['Choose column:'],
                   style={'font-weight': 'bold', "text-align": "center"}),

        dcc.Dropdown(id='my_dropdown',
                     options=[
                         {'label': 'Species', 'value': 'Animal Class'},
                         {'label': 'Final Ranger Action',
                             'value': 'Final Ranger Action'},
                         {'label': 'Age', 'value': 'Age', 'disabled': True},
                         {'label': 'Animal Condition', 'value': 'Animal Condition'},
                         {'label': 'Borough', 'value': 'Borough'},
                         {'label': 'Species Status', 'value': 'Species Status'}
                     ],
                     optionHeight=35,  # height/space between dropdown options
                     value='Borough',  # dropdown value selected automatically when page loads
                     disabled=False,   # disable dropdown value selection
                     multi=False,      # allow multiple dropdown values to be selected
                     searchable=True,  # allow user-searching of dropdown values
                     search_value='',  # remembers the value searched in dropdown
                                       # gray, default text shown when no option is selected
                     placeholder='Please select...',
                     clearable=False,  # allow user to removes the selected value
                                       # use dictionary to define CSS styles of your dropdown
                     style={'width': "100%"},
                     # className='select_box',           #activate separate CSS document in assets folder
                     # persistence=True,                 #remembers dropdown value. Used with persistence_type
                     # persistence_type='memory'         #remembers dropdown value selected until...
                     ),                                     # 'memory': browser tab is refreshed
                                                            # 'session': browser tab is closed
                                                            # 'local': browser cookies are deleted
    ], className='three columns'),

])


@app.callback(
    Output(component_id='our_graph', component_property='figure'),
    [Input(component_id='my_dropdown', component_property='value')]
)
def build_graph(column_chosen):
    fig = px.pie(df, names=column_chosen)

    fig.update_traces(textinfo='percent+label')
    fig.update_layout(title={'text': 'NYC Calls for Animal Rescue',
                             'font': {'size': 28},
                             'x': 0.5,
                             'xanchor': 'center'})
    return fig


@app.callback(
    Output(component_id='output_data', component_property='children'),
    [Input(component_id='my_dropdown', component_property='value')]
)
def set_selection(data_chosen):
    return f'Search value was: " {data_chosen} "'


if __name__ == '__main__':
    app.run_server(debug=True)
