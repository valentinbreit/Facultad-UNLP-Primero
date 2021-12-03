.data
Base: .double 5.85
Altura: .double 13.47
Superficie: .double 0
Valor: .double 2

.code
l.d f1, Base(r0)
l.d f2, Altura(r0)
l.d f3, Superficie(r0)
l.d f4, Valor(r0)
mul.d f3, f2, f1
div.d f3, f3, f4
s.d f3, Superficie(r0)
halt