import numpy as np
np.set_printoptions(threshold=np.nan)

def write_line(f,l):
    file.write(l+"\n")

def get_row_str(n,end_char):
    row = np.random.rand(n)
    row_str = "(ARRAY"+repr(row)[6:-1]
    row_str += ", "+str(np.random.randint(0,9)) + ")"+end_char
    return row_str

def make_table(table_name, n_rows, n_features):
    print (n_rows,n_features)
    drop_table = "DROP TABLE IF EXISTS " + table_name + ";"
    create_table = "CREATE TABLE "+table_name + " (x DOUBLE PRECISION[], y INTEGER, id serial);"
    write_line(file,drop_table)
    write_line(file,create_table)
    write_line(file,"INSERT INTO "+table_name+" VALUES")
    row_strs = []
    for _ in range(n_rows-1):
        row_str = get_row_str(n_features,",")
        row_strs.append(row_str)
        if(_%10000==0):
            print str(float(_)/n_rows)+"%"
            write_line(file,"\n".join(row_strs))
            row_strs = []
    write_line(file,"\n".join(row_strs))
    row_str = get_row_str(n_features,";")
    write_line(file,row_str)

# rows = [('1e1',int(1e1))]
# default_rows = ('1e1',int(1e1))
# features = [('1e1',int(1e1))]
# default_features = ('5',int(5))

rows = [('1e6',int(1e6)),('1e7',int(1e7)),('1e8',int(1e8))]
default_rows = ('1e5',int(1e5))
features = [('1e1',int(1e1)),('1e2',int(1e2)),('1e3',int(1e3))]
default_features = ('1e1',int(1e1))

with open('data.sql', 'w') as file:
    for s,n_rows in rows:
        table_name = "mlp_"+s+"_"+default_features[0]
        n_features = default_features[1]
        make_table(table_name, n_rows, n_features)
    for s,n_features in features:
        n_rows = default_rows[1]
        table_name = "mlp_"+default_rows[0]+"_"+s
        make_table(table_name, n_rows, n_features)
