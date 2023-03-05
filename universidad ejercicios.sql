/* num 1 */ select apellido1,apellido2,nombre,tipo from persona where tipo = "alumno" order by apellido1;
/* num 2 */ select nombre,apellido1,apellido2,telefono,tipo from persona where telefono is null and tipo = "alumno";
/* num 3 */ select nombre,apellido1,apellido2,fecha_nacimiento,tipo from persona where year(fecha_nacimiento) = 1999 and tipo = "alumno";
/* num 4 */ select nif,nombre,apellido1,apellido2,telefono,tipo from persona where telefono is null and tipo = "profesor" and SUBSTRING( nif , -1 , 1 ) = "k";
/* num 5 */ select nombre,cuatrimestre,curso, id_grado from asignatura where id_grado = 7 and cuatrimestre = 1 and curso = 3;
/* num 6 */ select apellido1,apellido2,p.nombre,d.nombre as departamento from profesor pr 
						join persona p on p.id = pr.id_profesor
						join departamento d on d.id = pr.id_departamento order by apellido1, nombre;
/* num 7 */ SELECT a.nombre,anyo_inicio,anyo_fin FROM alumno_se_matricula_asignatura as alm 
						  join persona p on alm.id_alumno = p.id
						  join asignatura a on alm.id_asignatura = a.id
						  join curso_escolar ce on alm.id_curso_escolar = ce.id
						  where nif = "26902806M";
/* num 8 */ SELECT distinct d.nombre FROM profesor pr JOIN departamento d ON  d.id = pr.id_departamento
						JOIN asignatura a ON pr.id_profesor = a.id_profesor 
                        WHERE id_grado = (select id from grado where nombre = "Grado en Ingeniería Informática (Plan 2015)");
/* num 9 */ SELECT distinct p.apellido1,p.apellido2,p.nombre,ce.anyo_inicio,ce.anyo_fin FROM alumno_se_matricula_asignatura alm 
						 JOIN persona p ON  alm.id_alumno = p.id
						 JOIN curso_escolar ce ON alm.id_curso_escolar = ce.id 
						 JOIN asignatura a ON alm.id_asignatura = a.id where anyo_fin = 2019 and anyo_inicio = 2018;

/* LEFT JOIN  Y RIGTH JOIN  */      
    
/* num 1 */  select d.nombre,p.apellido1,p.apellido2,p.nombre from profesor pr 
						 left join persona p on p.id = pr.id_profesor
						 right join departamento d on d.id = pr.id_departamento 
                         order by d.nombre,p.apellido1,p.nombre;
/* num 2 */  select d.nombre,p.apellido1,p.apellido2,p.nombre from profesor pr 
						 left join persona p on p.id = pr.id_profesor
						 join departamento d on d.id = pr.id_departamento 
                         where d.nombre is null
                         order by d.nombre, p.apellido1 ,p.nombre;
/* num 3 */ select d.nombre,p.apellido1,p.apellido2,p.nombre from profesor pr 
						join persona p on p.id = pr.id_profesor
						 right join departamento d on d.id = pr.id_departamento
                         where apellido1 is null;
/* num 4 */ select apellido1,apellido2,p.nombre,p.tipo,a.nombre as asignatura from profesor pr 
						 join persona p on p.id = pr.id_profesor
						 left join asignatura a  on a.id_profesor = pr.id_profesor
                         where a.nombre is null;
/* num 5 */ select a.nombre,pr.id_profesor from profesor pr 
						 right join persona p on p.id = pr.id_profesor
						 right join asignatura a  on a.id_profesor = pr.id_profesor
                         where pr.id_profesor is null;
/* num 6 */ select distinct d.nombre as Departamento, n.nombre as asignatura,n.anyo_inicio,n.anyo_fin  from profesor pr left join departamento d on d.id = pr.id_profesor
									 left join (select a.id_profesor,a.nombre,anyo_inicio,anyo_fin from alumno_se_matricula_asignatura alm 
											join curso_escolar ce on alm.id_curso_escolar = ce.id
											join asignatura a  on a.id = alm.id_asignatura				
											join persona p on alm.id_alumno = p.id)as n on pr.id_profesor = n.id_profesor
                                            where n.nombre is null order by d.nombre desc;
                                            
/* consult resum: */

/* num 1 */ SELECT COUNT(tipo) FROM persona  WHERE tipo = "alumno";
/* num 2 */ SELECT COUNT(tipo) FROM persona  WHERE tipo = "alumno" and year(fecha_nacimiento) ="1999";
/* num 3 */ select d.nombre, count(*) as profesores from profesor pr join departamento d on pr.id_departamento = d.id
                                         join persona p on pr.id_profesor = p.id
                                         group by d.nombre 
                                         order by profesores ;
/* num 4 */ select  d.nombre as departamento, count(pr.id_departamento) as profes
							  from profesor pr 
							  right join departamento d on pr.id_departamento = d.id
							  left join persona p on pr.id_profesor = p.id
                              group by d.nombre, pr.id_departamento;
/* num 5 */ select distinct g.nombre, count(a.id_grado) as asignaturas  from grado g 
											 left join asignatura a on a.id_grado = g.id
                                             group by a.id_grado, g.nombre
                                             order by asignaturas desc;
									
/* num 6 */ select g.nombre, count(a.id_grado) as asignaturas  from grado g
													left join asignatura a on a.id_grado = g.id 
													group by g.nombre, a.id_grado
                                                    having asignaturas > 40;
/* num 7 */ select  g.nombre,  a.tipo, sum( a.creditos) as total_creditos 
													from grado g 
                                                    right join asignatura a on a.id_grado = g.id 
													group by g.nombre,a.tipo,a.creditos;
/* num 8 */ select distinct anyo_inicio,count(id_asignatura) as alumnos_matriculados 
													from alumno_se_matricula_asignatura alm 
													right join curso_escolar ce on alm.id_curso_escolar = ce.id
													group by anyo_inicio, id_asignatura;
/* num 9 */ select  p.id, p.nombre, p.apellido1,p.apellido2, count(pr.id_profesor ) as asignaturas from profesor pr 
						  right join asignatura a on pr.id_profesor = a.id_profesor
                          right join persona p on pr.id_profesor = p.id
                          where p.tipo = "profesor"
                          group by p.id, p.nombre,p.apellido1,p.apellido2,p.tipo
                          order by  asignaturas desc;
/* num 10 */ select * from persona where fecha_nacimiento = (select max(fecha_nacimiento) from persona where tipo = "alumno") ;
/* num 11 */ select  pr.id_profesor,p.nombre,p.apellido1,p.apellido2,d.nombre,a.nombre as asignaturas  
							from profesor pr  join departamento d on pr.id_departamento = d.id
							left join asignatura a on pr.id_profesor = a.id_profesor
							left join persona p on p.id = pr.id_profesor
                            where a.nombre is null
                            order by pr.id_profesor;
                         


                         
