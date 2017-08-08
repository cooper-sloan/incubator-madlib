import itertools

def cart_prod(dicts):
    return (dict(itertools.izip(dicts, x)) for x in itertools.product(*dicts.itervalues()))

def update(d):
    z = default_vars.copy()
    z.update(d)
    return z

default_vars = {
        'rows':['1e6'],
        'features':['1e1'],
        'hidden_layer_sizes':[[50,50]],
        'iterations':[10],
        }

rows = update({
        'rows' : ['1e6','1e7','1e8']
        })
features = update({
        'features' : ['1e1','1e2','1e3']
        })
n_layers = update({
        'hidden_layer_sizes' : [[50],[50,50],[50,50,50],[50,50,50,50]]
        })
n_units = update({
        'hidden_layer_sizes' : [[10],[100],[1000]]
        })
n_iterations = update({
        'iterations' : [10,100,1000,10000]
        })

vars = {"rows":rows,"features":features,"n_layers":n_layers,"n_units":n_units,"n_iterations":n_iterations}

template = """DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_{rows}_{features}', 'mlp_out', 'x', 'y', ARRAY{hidden_layer_sizes}, 'tolerance=0, n_iterations={iterations}', 'sigmoid', NULL, FALSE, FALSE);\n"""

out='\\timing on\n'
for k,v in vars.items():
    out += "\n-- Testing " + str(k) + "\n"
    for d in cart_prod(v):
        out += template.format(**d)

with open('test.sql', 'w') as file:
    file.write(out)
