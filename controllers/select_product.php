<?php
    include ('../config/conexion.php');
    include ('../config/variables.php');
    
    if($_GET['action'] == 'listar'){
        //$sqlGetProducts = "SELECT id, nombre, (SELECT nombre FROM $tCategory WHERE id=$tProduct.categoria_id) as categoria, (SELECT nombre FROM $tSubCategory WHERE id=$tProduct.subcategoria_id) as subcategoria, precio, img, (SELECT nombre FROM $tEst WHERE id=$tProduct.activo) as activoN, activo  FROM $tProduct  ";
        $sqlGetProducts = "
            SELECT
                productos.id AS id,
                productos.nombre AS nombre,
                categorias.nombre AS categoria,
                subcategorias.nombre as subcategoria,
                productos.precio_publico AS precio,
                productos.img AS img,
                estatus.nombre AS activoN,
                productos.activo AS activo,
                categorias.id AS categoryId
            FROM productos
            INNER JOIN categorias ON  productos.categoria_id = categorias.id
            INNER JOIN subcategorias ON productos.subcategoria_id = subcategorias.id
            INNER JOIN estatus ON productos.activo = estatus.id
        ";
        
        // Ordenar por
	$est = $_POST['estatus'] - 1;
        if($est >= 0) $sqlGetProducts .= " WHERE $tProduct.activo='$est' ";
        
        //Ordenar ASC y DESC
	$vorder = (isset($_POST['orderby'])) ? $_POST['orderby'] : "";
	if($vorder != ''){
            $sqlGetProducts .= " ORDER BY ".$vorder;
	}else{
            $sqlGetProducts .= " ORDER BY categoryId, nombre ";
        }
        
        //Ejecutamos query
        // echo '<br>query: '.$sqlGetProducts.'<br>';
        $resGetProducts = $con->query($sqlGetProducts);
        if( $resGetProducts->num_rows > 0 ){
            $datos = '';
            //$datos .= '<tr><td colspan="7">'.$sqlGetCateories.'</td></tr>';
            while ($rowGetProducts = $resGetProducts->fetch_assoc()) {
                $datos .= '<tr>';
                $datos .= '<td>'.$rowGetProducts['id'].'</td>';
                $datos .= '<td><img src="' . $rutaImgProd . $rowGetProducts['img'] . '" class="img-product-list"></td>';
                $datos .= '<td>'.$rowGetProducts['nombre'].'</td>';
                $datos .= '<td>'.$rowGetProducts['categoria'].'</td>';
                $datos .= '<td>'.$rowGetProducts['subcategoria'].'</td>';
                $datos .= '<td>'.$rowGetProducts['precio'].'</td>';
                $datos .= '<td>'.$rowGetProducts['activoN'].'</td>';
                $datos .= '<td><a href="form_update_product.php?id=' . $rowGetProducts['id'] . '" target="_blanck">Modificar</a></td>';
                if($rowGetProducts['activo']==0)
                    $datos .= '<td><a class="activate" data-id="' . $rowGetProducts['id'] . '" >Dar de alta</a></td>';
                else
                    $datos .= '<td><a class="delete" data-id="' . $rowGetProducts['id'] . '" >Dar de baja</a></td>';
                $datos .= '</tr>';
            }
            echo $datos;
        }else{
            echo '<tr><td colspan=8>No existen productos aún</td></tr>';
        }
    }
    
?>
