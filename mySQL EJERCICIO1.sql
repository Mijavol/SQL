/* num 1.*/  SELECT nombre FROM producto;
/* NUM 2.*/  SELECT nombre,precio FROM producto;
/* NUM 3 */  DESCRIBE producto;
/* num 4.*/  SELECT  nombre,precio,ROUND(precio / 0.94, 2) AS USD FROM PRODUCTO;
/* NUM 5.*/  SELECT nombre AS nombre_de_producto,precio AS Euros,ROUND(precio / 0.94, 2) AS Dolares_Estadounidenses FROM producto;
/* num 6 */  SELECT  upper(nombre),precio FROM producto;
/* num 7 */  SELECT  lower(nombre),precio FROM producto;
/* num 8 */  SELECT  nombre,SUBSTRING(UPPER(nombre),1,2) FROM fabricante;
/* num 9 */  SELECT nombre,round(precio,0) FROM producto; 
/* num 10 */ SELECT nombre,truncate(precio,0) FROM producto; 
/* NUM 11 */ SELECT codigo_fabricante FROM producto; 
/* NUM 12 */ SELECT DISTINCT codigo_fabricante FROM producto;
/* NUM 13 */ SELECT nombre FROM fabricante ORDER BY nombre ;
/* NUM 14 */ SELECT nombre FROM fabricante ORDER BY nombre DESC;
/* NUM 15 */ SELECT nombre,precio FROM producto ORDER BY nombre, precio DESC;
/* num 16 */ SELECT codigo, nombre FROM fabricante WHERE codigo <= 5 ;
/* num 17 */ SELECT codigo, nombre FROM fabricante WHERE codigo >= 4 and codigo <= 5 ; 
/* NUM 18 */ SELECT nombre, precio FROM producto ORDER BY precio limit 1;
/* NUM 19 */ SELECT nombre, precio FROM producto ORDER BY precio DESC limit 1;
/* NUM 20 */ SELECT codigo_fabricante,nombre FROM producto WHERE codigo_fabricante = 2;
/* NUM 21 */ SELECT producto.nombre,precio,fabricante.nombre FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
/* num 22 */ SELECT producto.nombre,precio,fabricante.nombre FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante order by fabricante.nombre asc;
/* num 23 */ SELECT producto.codigo,producto.nombre,fabricante.codigo ,fabricante.nombre  FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
/* num 24 */ SELECT producto.nombre, precio,fabricante.nombre  FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante order by precio asc limit 1;
/* num 25 */ SELECT producto.nombre, precio,fabricante.nombre  FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante order by precio desc limit 1;
/* num 26 */ SELECT producto.nombre, precio,fabricante.nombre  FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante and fabricante.nombre = "Lenovo" ; 
/* num 27 */ SELECT producto.nombre, precio,fabricante.nombre  FROM producto inner JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante and fabricante.nombre = "crucial" and precio > 200; 
/* num 28 */ SELECT p.nombre, precio,f.nombre  FROM fabricante f  join producto p on f.codigo = p.codigo_fabricante where f.nombre = "seagate" OR f.nombre = "asus" OR f.nombre = "Hewlett-Packard";
/* num 29 */ SELECT p.nombre, precio,f.nombre  FROM fabricante f  join producto p on f.codigo = p.codigo_fabricante where f.nombre IN ("seagate" ,"asus" ,"Hewlett-Packard" ) ;
/* num 30 */ SELECT p.nombre, precio,f.nombre FROM fabricante f  join producto p on f.codigo = p.codigo_fabricante where SUBSTRING( f.nombre , -1 , 1 ) = "e";
/* num 31 */ SELECT p.nombre, precio,f.nombre FROM fabricante f  left join producto p on f.codigo = p.codigo_fabricante where f.nombre like "%w%" ;
/* num 32 */ SELECT p.nombre, precio,f.nombre FROM fabricante f  left join producto p on f.codigo = p.codigo_fabricante where precio >= 180 order by precio desc, p.nombre;
/* num 33 */ SELECT p.nombre, precio,f.nombre FROM fabricante f  inner join producto p on f.codigo = p.codigo_fabricante ;
/* num 34 */ SELECT p.nombre, precio,f.nombre FROM fabricante f  left join producto p on f.codigo = p.codigo_fabricante ;
/* num 35 */ SELECT f.nombre,p.nombre as producto, precio FROM fabricante f  left join producto p on f.codigo = p.codigo_fabricante where p.nombre is null ;
/* num 36 */ SELECT * FROM producto where codigo_fabricante IN(SELECT codigo from fabricante where nombre = "lenovo");
/* num 37 */ SELECT * FROM producto where codigo_fabricante IN(SELECT codigo from fabricante where nombre = "lenovo") order by precio desc limit 1;
/* num 38 */ SELECT p.nombre as nom_producto, precio, f.nombre FROM fabricante f join producto p on f.codigo = p.codigo_fabricante where f.nombre = "lenovo" order by precio desc limit 1 ;
/* num 39 */ SELECT p.nombre as nom_producto, precio, f.nombre FROM fabricante f join producto p on f.codigo = p.codigo_fabricante where f.nombre = "Hewlett-Packard" order by precio  limit 1 ;
/* num 40 */ SELECT p.nombre, precio, f.nombre FROM fabricante f 
				 join producto p on f.codigo = p.codigo_fabricante 
				 where (SELECT MAX(precio) FROM fabricante f 
						join producto p on f.codigo = p.codigo_fabricante
						where f.nombre = "lenovo") <= precio;
/* num 41 */ SELECT p.nombre, precio, f.nombre FROM fabricante f 
				join producto p on f.codigo = p.codigo_fabricante
				where ((select AVG(precio) FROM producto p
					join fabricante f  on f.codigo = p.codigo_fabricante) <= precio) 
                    and f.nombre = "asus";                        
