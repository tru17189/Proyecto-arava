from math import floor
import pandas as pd
data = pd.read_excel (r'Recursos/OS_SAP.xlsx')
agenda = []

for nombre, codigo, cliente, tipo_aeroave, division, departamento in zip(data['Servicio brindado'], 
                                    data['Code'], data['Cliente'], 
                                    data['Tipo de aeronave'], data['Division'], data['Departamento']):
    codigo = floor(codigo)
    a = [nombre, codigo, cliente, tipo_aeroave, division, departamento]
    if a not in agenda:
        agenda.append(a)

for i in agenda:
    print("""insert into [dbo].[Servicios] (nombre, codigo, cliente, aeronave, division, departamento)
    values ('%s', %s, '%s', '%s', '%s', '%s')
    """ %(i[0], i[1], i[2], i[3], i[4], i[5]))
