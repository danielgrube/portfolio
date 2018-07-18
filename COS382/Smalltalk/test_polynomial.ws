| p q r |

p := Polynomial new initialize: #(4 5 0 12 8).
q := Polynomial new initialize: #(5 3 6 10 0 4).
r := Polynomial new initialize: #(-7 5 3).

p sum: q.

p evaluate: 1.5.

p evaluate.

r differentiate.

r graphFrom: 0 graphTo: 10.