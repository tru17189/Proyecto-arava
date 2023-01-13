/*Los siguientes queries son los necesarios para poder replicar todas las beses de datos de consulta de LAATS, para que este
proceso funcione correctamente es necesario correr lo queries en el orden que aparecen, para tener una mejor comprension ver el 
diagrama de las bases de datos adjunta en esta carpeta.*/

/*QUERY PARA REPLICAR 'itinerarios'*/
CREATE TABLE itinerarios (
    no_correlativo int not null IDENTITY(1, 1),
    year int,
    dia int,
    mes int,
    departamento varchar(10),
    origen varchar(3),
    destino varchar(3),
    hora_ingreso TIME,
    hora_egreso TIME,
    no_vuelo varchar(11),
    operador varchar(37),
    tipo_operacion varchar(9),
    fecha DATE,
    borrar BIT default 'false',
    tipo_aeronave varchar(13),
    puerta varchar(27),
    matricula varchar(11),
    CONSTRAINT PK_no_correlativo PRIMARY KEY (no_correlativo)
);

/*QUERY PARA REPLICAR 'Control_De_Tiempos'*/
CREATE TABLE Control_De_Tiempos (
    no_correlativo int, 
    demoras_arribo_responsabilidad_laats BIT default 'false',
    carga_danada_arribo BIT default 'false',
    generaron_reportes_mejora_externa BIT default 'false',
    carga_danada_salida BIT default 'false',
    demora_salida_responsabilidad_laats BIT default 'false',
    demora_salida_no_responsabilidad_laats BIT default 'false',
    demora_colocacion_carga_rampa_exportacion BIT default 'false',
    demora_clasificacion_courier_importacion BIT default 'false',
    equipaje_danado_arribo BIT default 'false',
    equipaje_danado_salida BIT default 'false',
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'Control_De_Eventos'*/
CREATE TABLE Control_De_Eventos (
    no_correlativo int,
    demoras_arribo_responsabilidad_laats BIT default 'false',
    carga_danada_arribo BIT default 'false',
    generaron_reportes_mejora_externa BIT default 'false',
    carga_danada_salida BIT default 'false',
    demora_salida_responsabilidad_laats BIT default 'false',
    demora_salida_no_responsabilidad_laats BIT default 'false',
    demora_colocacion_carga_rampa_exportacion BIT default 'false',
    demora_clasificacion_courier_importacion BIT default 'false',
    equipaje_danado_arribo BIT default 'false',
    equipaje_danado_salida BIT default 'false',
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'control_de_tiempos_fbo'*/
CREATE TABLE control_de_tiempos_fbo (
    no_correlativo int,
    entrada_briefing BIT default 'false',
    hora_aterrizaje BIT default 'false',
    hora_asegurado BIT default 'false',
    inicio_descarga_equipaje BIT default 'false',
    entrega_equipaje BIT default 'false',
    recepcion_equipaje BIT default 'false',
    fin_carga_equipaje BIT default 'false',
    compartimientos_cerrados BIT default 'false',
    inicio_limpieza_cabina BIT default 'false',
    fin_limpieza_cabina BIT default 'false',
    puerta_cerrada BIT default 'false',
    hora_salida_rampa BIT default 'false',
    hora_despegue BIT default 'false',
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'control_eventos_observaciones'*/
CREATE TABLE control_eventos_observaciones (
    no_correlativo int,
    observacion varchar(256);
    crew_chief int,
    FOREIGN KEY (crew_chief) REFERENCES Personal_General(codigo_empleado)
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'desglose_cargado_saliendo_pxs'*/
CREATE TABLE desglose_cargado_saliendo_pxs (
    no_correlativo int,
    origen varchar(3),
    destino varchar(3),
    equipaje_priority int,
    equipaje_turista int, 
    carga int, 
    otros varchar(150),
    bin varchar(6),
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'equipos_utilizados_vuelos_pxs'*/
CREATE TABLE equipos_utilizados_vuelos_pxs(
    no_correlativo int,
    tractor1 varchar(10),
    tractor2 varchar(10),
    tractor3 varchar(10),
    tractor4 varchar(10),
    faja1 varchar(10),
    faja2 varchar(10),
    escalera varchar(10),
    remolcador_aeronave varchar(10),
    agua_potable varchar(10),
    drenadora varchar(10),
    gpu varchar(10),
    barra varchar(10),
    acu varchar(10),
    asu varchar(10),
    loader_main_deck varchar(10),
    extintor_robot int,
    unidad_fod int,
    montacargas1 varchar(10),
    montacargas2 varchar(10),
    montacargas3 varchar(10),
    montacargas4 varchar(10),
    carreta1 varchar(10),
    carreta2 varchar(10),
    carreta3 varchar(10),
    carreta4 varchar(10),
    carreta5 varchar(10),
    dollies_cantidad int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'equipos_utilizados_vuelos_cgo'*/
CREATE TABLE equipos_utilizados_vuelos_cgo (
    no_correlativo int,
    tractor1 varchar(10),
    tractor2 varchar(10),
    tractor3 varchar(10),
    tractor4 varchar(10),
    faja1 varchar(10),
    faja2 varchar(10),
    escalera varchar(10),
    remolcador_aeronave varchar(10),
    agua_potable varchar(10),
    drenadora varchar(10),
    gpu varchar(10),
    barra varchar(10),
    acu varchar(10),
    asu varchar(10),
    loader_main_deck varchar(10),
    loader_lower_deck varchar(10),
    extintor_robot int,
    unidad_fod int,
    montacargas1 varchar(10),
    montacargas2 varchar(10),
    montacargas3 varchar(10),
    montacargas4 varchar(10),
    carreta1 varchar(10),
    carreta2 varchar(10),
    carreta3 varchar(10),
    carreta4 varchar(10),
    carreta5 varchar(10),
    dollies_cantidad int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'fallas_equipo_durante_operacion'*/
CREATE TABLE fallas_equipo_durante_operacion (
    no_correlativo int,
    codigo_unidad varchar(10),
    descripcion varchar(256),
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'fases_atencion_aeronave'*/
CREATE TABLE fases_atencion_aeronave (
    no_correlativo int,
    fase_1 BIT default 'false',
    fase_2 BIT default 'false',
    fase_3 BIT default 'false',
    fase_4 BIT default 'false',
    fase_5 BIT default 'false',
    fase_6 BIT default 'false',
    fase_7 BIT default 'false',
    fase_8 BIT default 'false',
    fase_9 BIT default 'false',
    fase_10 BIT default 'false',
    iniciada BIT default 'false',
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'funciones_personal_operacion_cgo'*/
CREATE TABLE funciones_personal_operacion_cgo (
    no_correlativo int,
    marshalling_aeronave1 int,
    hombres_bandera_arribo1 int,
    hombres_bandera_arribo2 int,
    operador_remolcador_aeronave1 int,
    acople_desacople_escalera1 int,
    hombre_guia_acople_loader_main_deck1 int,
    hombre_guia_acople_loader_lower_deck1 int,
    operador_tractores1 int,
    operador_tractores2 int,
    operador_tractores3 int,
    operador_tractores4 int,
    operador_montacargas1 int,
    operador_montacargas2 int,
    operador_montacargas3 int,
    hombre_guia_acople_fajas1 int,
    hombre_guia_acople_fajas2 int,
    hombre_guia_desacople_loader_main_deck1 int,
    hombre_guia_desacople_loader_lower_deck1 int,
    hombre_guia_desacople_fajas1 int,
    hombre_guia_desacople_fajas2 int,
    drenado_aeronave1 int,
    drenado_aeronave2 int,
    aplicacion_agua_potable1 int,
    hombres_bandera_salida1 int,
    hombres_bandera_salida2 int,
    otros int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'funciones_personal_operacion_pxs'*/
CREATE TABLE funciones_personal_operacion_pxs (
    no_correlativo int,
    mostrador_chequeo1 int,
    mostrador_chequeo2 int,
    area_rayos_x1 int,
    area_rayos_x2 int,
    marshalling_aeronave1 int,
    puntas_ala_arribo1 int,
    puntas_ala_arribo2 int,
    operador_tractores1 int,
    operador_tractores2 int,
    operador_tractores3 int,
    hombre_guia_acople_fajas1 int,
    hombre_guia_acople_fajas2 int,
    operador_carga1 int,
    drenado_aeronave1 int,
    drenado_aeronave2 int,
    aplicacion_agua_potable1 int,
    acople_desacople_escalera1 int,
    hombre_guia_desacople_fajas1 int,
    hombre_guia_desacople_fajas2 int,
    operador_remolque_aeronave1 int,
    puntas_ala_salida1 int,
    puntas_ala_salida2 int,
    otros int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'moviento_de_carga_cgo'*/
CREATE TABLE moviento_de_carga_cgo (
    no_correlativo int,
    posiciones_entrando_main_deck int,
    posiciones_saliendo_main_deck int,
    posiciones_transito_cargadas int,
    posiciones_transito_descargadas int,
    carga_entrando int,
    carga_saliendo int,
    posiciones_entrando_lower_deck int,
    posiciones_saliendo_lower_deck int,
    peso_total_entrando float,
    peso_total_saliendo float,
    otros_entrando int,
    otros_saliendo int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'moviento_de_carga_pxs'*/
CREATE TABLE moviento_de_carga_pxs (
    no_correlativo int,
    equipaje_priority_entrando int,	
    equipaje_priority_saliendo int,
    comat_entrando int,
    comat_saliendo int,
    equipaje_turista_entrando int,
    equipaje_turista_saliendo int,
    avi_entrando int,
    avi_saliendo int,
    carga_entrando_piezas int,
    carga_saliendo_piezas int,
    aog_entrando int,
    aog_saliendo int,
    carga_entrando_peso float,
    carga_saliendo_peso float,
    otros_entrando int,
    otros_saliendo int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'moviento_de_carga_fbo'*/
CREATE TABLE moviento_de_carga_fbo (
    no_correlativo int,
    compartimiento_delantero_piezas_entrando: int,
    compartimiento_delantero_piezas_transito: int,
    compartimiento_delantero_piezas_saliendo: int,
    compartimiento_cabina_piezas_entrando: int,
    compartimiento_cabina_piezas_transito: int,
    compartimiento_cabina_piezas_saliendo: int,
    compartimiento_trasero_piezas_entrando: int,
    compartimiento_trasero_piezas_transito: int,
    compartimiento_trasero_piezas_saliendo: int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'personal_compartimiento_pxs'*/
CREATE TABLE personal_compartimiento_pxs (
    no_correlativo int,
    pc_delantero_arriba1 int,
    pc_delantero_arriba2 int,
    pc_delantero_abajo1 int,
    pc_delantero_abajo2 int,
    pc_trasero_arriba1 int,
    pc_trasero_arriba2 int,
    pc_trasero_abajo1 int,
    pc_trasero_abajo2 int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);

/*QUERY PARA REPLICAR 'personal_asignado_cgo'*/
CREATE TABLE personal_asignado_cgo (
    no_correlativo int,
    pa_main_deck1 int,
    pa_main_deck2 int,
    pa_main_deck3 int,
    pa_main_deck4 int,
    pa_main_deck5 int,
    pa_main_deck6 int,
    pa_despaletizado_general1 int,
    pa_despaletizado_general2 int,
    pa_compartimiento_lower_deck1 int,
    pa_compartimiento_lower_deck2 int,
    pa_despaletizado_courier_impo1 int,
    pa_despaletizado_courier_impo2 int,
    FOREIGN KEY (no_correlativo) REFERENCES itinerarios(no_correlativo)
);