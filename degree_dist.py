import matplotlib.pyplot as plt
import networkx as nx
import math as m

G = nx.Graph()

fh = open('edge_list.txt', 'r')
for line in fh:
    line = line[:-1]
    n1 = int(line.split("\t")[0])
    n2 = int(line.split("\t")[1])
    G.add_edge(n1,n2)
fh.close()

print G.number_of_nodes()
print G.number_of_edges()

# plot PDF on linear scale
N = G.number_of_nodes()
degrees = [ G.degree(node) for node in G.nodes() ]
x_vals = sorted(set(degrees)) # list of distinct degree values

degree_dict = {}

# Generates degree counts in O(N)
for degree in degrees:
    if degree in degree_dict:
        degree_dict[degree] += 1
    else:
        degree_dict[degree] = 1

for key in degree_dict.keys():
    cur_val = float(degree_dict[key])
    degree_dict[key] = cur_val / N


# Note that now, degree_dict is the pdf
pdf = degree_dict

y_vals = [ pdf[x] for x in x_vals ]
plt.plot(x_vals, y_vals, 'o-')
plt.show()

# Plots PDF on loglog scale
# NOT PARALLELIZED -- slower than needs to be

xl_vals = [m.log(x) for x in x_vals]
yl_vals = [m.log(y) for y in y_vals]

plt.plot(xl_vals, yl_vals, 'o-')
plt.show()

ccdf = y_vals

current_p = 0
for i in range(0, len(y_vals)):
    current_p += y_vals[i]
    ccdf[i] = 1 - current_p

ccdf_l = [m.log(p) for p in ccdf]

# TODO - plot CCDF on loglog scale
plt.plot(xl_vals, ccdf_l, 'o-')
plt.show()
